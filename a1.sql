
procedure Vn_extract_inactive_subs(p_datdeb   varchar2,
                                   p_datfin   varchar2,
                                   p_duration varchar2,
                                   p_cardtype varchar2,
                                   p_cstat    varchar2,
                                   p_email    varchar2,
                                   P_numproc  usr_procedure.numproc%type) is

  /***************************************************************************************************************
    PURPOSE:   Extract Ended or Ending BASIC/PREM subs
    REQUESTOR: 
    VERSIONS:
    Ver        Date        Author           Description
    ---------  ----------  ---------------  ----------------------------------------------------
    1.0        10/2015     NTNAM            Created this procedure
  **************************************************************************************************************/

  wfichier      UTL_FILE.FILE_TYPE;
  wchemin       varchar2(255) := 'EXTRACT'; --'d:\oracle\utl\Extract\';
  wnomfichier   varchar2(355) := 'Extract_InactiveSubs_' || p_datdeb || 'to' ||
                                 p_datfin || /*'_'||to_char(sysdate,'hh24mi')||*/
                                 '.csv';
  wto           varchar2(1000);
  wfrom         varchar2(100);
  wsubj         varchar2(50);
  wbody         varchar2(5000);
  wcc           varchar2(100);
  wpj           p_vn_mail.tab_file;
  wcontent_type varchar2(20);
  wpj_body      varchar2(1);
  wfileh        utl_file.file_type;
  rc            sys_refcursor;
  wline         varchar2(8000);
  wquery        varchar2(8200);
  wquery1       varchar2(500);
  wquery2       varchar2(100);
  wquery3       varchar2(100);
  wronginput_duration exception;
  wronginput_cardtype exception;
  wronginput_cstat    exception;
  wdrop1    varchar(100) := 'drop index VN_NUMABO_TEMP_ID1';
  wdrop2    varchar(100) := 'drop index VN_NUMABO_TEMP_ID2';
  wcreate1  varchar(100) := 'create index VN_NUMABO_TEMP_ID1 on VN_NUMABO_TEMP(Numabo)';
  wcreate2  varchar(100) := 'create index VN_NUMABO_TEMP_ID2 on VN_NUMABO_TEMP(Numabont)';
  wtruncate varchar(50) := 'truncate table VN_NUMABO_TEMP';
begin
  dbms_output.enable(1000000000);
  -- check parameters       
  if trim(p_duration) is null then
    wquery1 := '';
  elsif trim(p_duration) not like '%,' then
    wquery1 := ' and ta.duree in (''' || replace(p_duration, ',', ''',''') ||
               ''')';
  end if;
  if trim(p_cardtype) is null then
    wquery2 := '';
  elsif trim(p_cardtype) not like '%,' then
    wquery2 := ' and ct.ctypdegateway in (''' ||
               replace(p_cardtype, ',', ''',''') || ''')';
  end if;
  if trim(p_cstat) is null then
    wquery3 := '';
  elsif trim(p_cstat) not like '%,' then
    wquery3 := ' and cs.cstat in (''' ||
               replace(upper(p_cstat), ',', ''',''') || ''')';
  end if;
  execute immediate wdrop1;
  execute immediate wdrop2;
  execute immediate wtruncate;
  insert into VN_NUMABO_TEMP
    select distinct a1.NUMABO,
                    a1.numabont,
                    null,
                    a1.CARTICLE,
                    a1.SEQREAB,
                    a1.DEBABO,
                    a1.FINABO,
                    a1.duree,
                    a1.cactiv,
                    null,
                    case
                      when a2.ccoupon is null then
                       'NO'
                      when to_char(pc.finval, 'yyyymmdd') is null or
                           to_char(sysdate, 'yyyymmdd') not between
                           to_char(pc.debval, 'yyyymmdd') and
                           to_char(pc.finval, 'yyyymmdd') then
                       'NO'
                      when a2.ccoupon is not null and
                           to_char(sysdate, 'yyyymmdd') between
                           to_char(pc.debval, 'yyyymmdd') and
                           to_char(pc.finval, 'yyyymmdd') then
                       a2.ccoupon
                    end ccoupon_active,
                    a1.numdist,
                    aad.cpostal,
                    var1.area
      from abovw_ctreahist a1,
           abo_coupon      a2,
           pro_coupon      pc,
           abo_adres       aad,
           cod_postal_tmp  var1
     where 1 = 1
       and a1.CSUPPORT = '02'
       and a1.CACTIV <> '21'
       and a1.cformu = '09'
       and to_char(a1.FINABO, 'yyyymmdd') >= p_datdeb
       and to_char(a1.FINABO, 'yyyymmdd') <= p_datfin
       and a1.SEQREAB = a1.maxseqreab
          /*and (a1.NUMABO, a1.NUMABONT) not in -- Ko lay goi tuong lai
          (select r.numabo,
                  r.numabont
             from abo_reahist r
            where r.seqreab > a1.seqreab)*/
       and a1.numabo = a2.numabo(+)
       and a1.numabont = a2.numabont(+)
       and a1.SEQREAB=a2.seqreab(+)
       and a2.ccoupon = pc.ccoupon(+)
       and aad.numabo = a1.numabo
       and aad.numabont = a1.numabont
       and aad.finadr is null
       and aad.cadres = 'MAIN'
       and var1.cpostal = aad.cpostal;
  commit;
  execute immediate wcreate1;
  execute immediate wcreate2;
  -- dbms_output.put_line(wquery2);
  -- dbms_output.put_line(wquery3);
  wquery := '           
        select ''numabo,numabont,numdist,numdec,finabo,duree,seqreab,carticle,type,no_type,telephone,telephone1,telephone2,mobile1,mobile2,home1,home2,work1,work2,ccoupon_active,cpostal,area'' as line from dual
        union all
        select distinct ta.numabo||'',''||
               ta.numabont||'',''||
               (select a.numdist from abo_reahist a where a.numabo=ta.numabo and a.numabont=ta.numabont and a.seqreab=0 and rownum<2)||'',''||
               tc.numdec||'',''||
               to_char(ta.finabo, ''dd/mm/yyyy'')||'',''||
               to_number(ta.duree)||'',''||
               ta.seq||'',''||
               ta.CARTICLE||'',''||
               case when ct.ctypdegateway = ''78'' then ''NAGRA''
                 when ct.ctypdegateway = ''MKEZ'' then ''myK+ NOW''
                 else ''VIACCESS''
               end||'',''||
               --decode(ct.ctypdegateway, ''78'', ''NAGRA'', ''VIACCESS'')||'',''||
               decode(telephone, null, ''INVALID'', ''VALID'')||'',''||
               telephone||'',''||
               telephone1||'',''||
               telephone2||'',''||
               td.mobile1||'',''||
               td.mobile2||'',''||
               td.home1||'',''||
               td.home2||'',''||
               td.work1||'',''||
               td.work2||'',''||       
               ta.ccoupon||'',''||
               ta.cpostal||'',''||
               ta.area
        from (select * from VN_NUMABO_TEMP where ccoupon <> ''NO''
              union all
              select * from VN_NUMABO_TEMP t2 where t2.ccoupon = ''NO'' 
              and not exists (select 1 from VN_NUMABO_TEMP where ccoupon <> ''NO''
                                       and numabo = t2.numabo
                                       and numabont = t2.numabo))ta,
              vnvw_abo_phone_v2 td,log_app_abont tc,cod_typde ct,abo_phone ap,cod_statart cs,pro_coupon pc
        where  1=1
           and ct.indgmta = ''1''
           and nvl(cconfigdroit, ''PRIM'') = ''PRIM''
           and ta.numabo = td.numabo(+)
           and ta.numabont = td.numabont(+)
           and ta.NUMABO = tc.numabo(+)
           and ta.numabont = tc.numabont(+)
           and ta.NUMABO = ap.numabo(+)
           and ta.numabont = ap.numabont(+)
           and tc.ctypde = ct.ctypde
           and cs.carticle = ta.CARTICLE
           and ta.ccoupon=pc.ccoupon (+)' || wquery1 || wquery2 ||
            wquery3 || '
           union all
           /**********************************
### Date create: 2017/09/07
### User create: VTQUYNH
### Comment: Extract thong tin thue bao inactive myK+, MyK+ Now

***********************************/

-- extract myK+  have finabo p_from_date to p_to_date
select ta.NUMABO ||'',''||
       ta.NUMABONT ||'',''||
       (select a.numdist from abo_reahist a where a.numabo=ta.numabo and a.numabont=ta.numabont and a.seqreab=0 and rownum<2)||'',''||
       vmr.smartcard ||'',''||
       to_char(ta.finabo, ''dd/mm/yyyy'')||'',''||
       to_number(ta.duree)||'',''||
       ta.seqreab ||'',''||
       ta.carticle ||'',''||
       ''MYKPLUS_NOW''  ||'',''||
       decode(vap.telephone, null, ''INVALID'', ''VALID'')  ||'',''||
       vap.telephone ||'',''||
       vap.MOBILE1 ||'',''||
       vap.MOBILE2 ||'',''||
       vap.HOME1 ||'',''||
       vap.HOME2 ||'',''||
       vap.WORK1 ||'',''||
       vap.WORK2 ||'',''||
       --vmr.email,
      /* case
         when a2.ccoupon is null then
          ''NO''
         when to_char(pc.finval, ''yyyymmdd'') is null or
              to_char(sysdate, ''yyyymmdd'') not between
              to_char(pc.debval, ''yyyymmdd'') and
              to_char(pc.finval, ''yyyymmdd'') then
          ''NO''
         when a2.ccoupon is not null and to_char(sysdate, ''yyyymmdd'') between
              to_char(pc.debval, ''yyyymmdd'') and
              to_char(pc.finval, ''yyyymmdd'') then
          a2.ccoupon
       end */
       case
         when a2.ccoupon is null then
          ''NO''
          else
            a2.ccoupon
            end ||'',''||
       tb.cpostal ||'',''||
       var1.area
  from abo_abont       ta,
       vnvw_abo_phone  vap,
       VN_MYKPLUS_REG  vmr,
       abo_adres       tb,
       VN_STAT_MYK_TBL cs,
       VN_STAT_MYK_TBL ct,
       --vtquynh fixed 2017/11/02 do double
       --abo_coupon      a2,
       --pro_coupon      pc,
       --
       (select a2.numabo, a2.numabont, a2.ccoupon, a2.seqreab
           from abo_coupon a2, pro_coupon pc
          where a2.ccoupon = pc.ccoupon
            and to_char(sysdate, ''yyyymmdd'') between
                to_char(pc.debval, ''yyyymmdd'') and
                to_char(pc.finval, ''yyyymmdd'')) a2,
       ---
       cod_postal_tmp  var1
 where vap.NUMABO(+) = ta.numabo
   and vap.NUMABONT(+) = ta.numabont
   and ta.numabo = a2.numabo(+)
   and ta.numabont = a2.numabont(+)
   and ta.seqreab = a2.seqreab(+)
  -- and a2.ccoupon = pc.ccoupon(+)
   and tb.numabo = ta.numabo
   and tb.numabont = ta.numabont
   and vmr.numabo = ta.numabo
   and vmr.numabont = ta.numabont
   and substr(vmr.smartcard,1,2) in ( ''12'',''11'')
   and to_char(ta.finabo, ''yyyymmdd'') between '''||p_datdeb||''' and '''||p_datfin||'''
   and ta.CFORMU = ''09''
   and cs.cstat = ''MYKPLUS_NOW''
   and cs.cstat= ct.cstat
 --  and (ct.cstat = &p_stat or &p_stat is null)
   and tb.cpostal = var1.cpostal
   and tb.commune = var1.commune '||wquery3||wquery1||wquery2||'

union all
--- inactive myK+
select ta.NUMABO ||'',''||
       ta.NUMABONT ||'',''||
       (select a.numdist from abo_reahist a where a.numabo=ta.numabo and a.numabont=ta.numabont and a.seqreab=0 and rownum<2)||'',''||
       vmr.smartcard ||'',''||
       to_char(ta.finabo, ''dd/mm/yyyy'')||'',''||
       to_number(ta.duree)||'',''||
       ta.seqreab ||'',''||
       ta.carticle ||'',''||
       ''MYKPLUS''  ||'',''||
       decode(vap.telephone, null, ''INVALID'', ''VALID'')  ||'',''||
       vap.telephone ||'',''||
       vap.MOBILE1 ||'',''||
       vap.MOBILE2 ||'',''||
       vap.HOME1 ||'',''||
       vap.HOME2 ||'',''||
       vap.WORK1 ||'',''||
       vap.WORK2 ||'',''||
       --vmr.email,
       /* case
         when a2.ccoupon is null then
          ''NO''
         when to_char(pc.finval, ''yyyymmdd'') is null or
              to_char(sysdate, ''yyyymmdd'') not between
              to_char(pc.debval, ''yyyymmdd'') and
              to_char(pc.finval, ''yyyymmdd'') then
          ''NO''
         when a2.ccoupon is not null and to_char(sysdate, ''yyyymmdd'') between
              to_char(pc.debval, ''yyyymmdd'') and
              to_char(pc.finval, ''yyyymmdd'') then
          a2.ccoupon
       end */
       case
         when a2.ccoupon is null then
          ''NO''
          else
            a2.ccoupon
            end ||'',''||
       tb.cpostal ||'',''||
       var1.area
  from abo_abont       ta,
       vnvw_abo_phone  vap,
       VN_MYKPLUS_REG  vmr,
       abo_adres       tb,
       VN_STAT_MYK_TBL cs,
       VN_STAT_MYK_TBL ct,
       --vtquynh fixed 2017/11/02 do double
       --abo_coupon      a2,
       --pro_coupon      pc,
       --
       (select a2.numabo, a2.numabont, a2.ccoupon, a2.seqreab
           from abo_coupon a2, pro_coupon pc
          where a2.ccoupon = pc.ccoupon
            and to_char(sysdate, ''yyyymmdd'') between
                to_char(pc.debval, ''yyyymmdd'') and
                to_char(pc.finval, ''yyyymmdd'')) a2,
       ---
       cod_postal_tmp  var1
 where vap.NUMABO(+) = ta.numabo
   and vap.NUMABONT(+) = ta.numabont
   and ta.numabo = a2.numabo(+)
   and ta.numabont = a2.numabont(+)
   and ta.seqreab = a2.seqreab(+)
  -- and a2.ccoupon = pc.ccoupon(+)
   and tb.numabo = ta.numabo
   and tb.numabont = ta.numabont
   and vmr.numabo = ta.numabo
   and vmr.numabont = ta.numabont
   and vmr.smartcard like ''135%''
   and to_char(ta.finabo, ''yyyymmdd'') between '''||p_datdeb||''' and '''||p_datfin||'''
   and ta.CFORMU = ''09''
   and cs.cstat = ''MYKPLUS''
   and ct.cstat = cs.cstat
   and tb.cpostal = var1.cpostal
   and tb.commune = var1.commune
  -- and (ct.cstat = &p_stat or &p_stat is null)
  '||wquery3||wquery1||wquery2||'';
  dbms_output.put_line(wquery);
  -- Change to csv file
  open rc for wquery;
  wfichier := utl_file.fopen_nchar(wchemin, wnomfichier, 'W');
  loop
    fetch rc
      into wline;
    exit when rc%notfound;
    -- DBMS_OUTPUT.PUT_LINE(wline || '     ' || 1);
    utl_file.put_line_nchar(wfichier, wline);
  end loop;
  close rc;
  utl_file.fclose(wfichier);
  --- send email
  wto           := p_email;
  wfrom         := 'statistic@vstv.vn';
  wcc   := 'pktuy@vstv.vn';
  wsubj         := 'Extract_InactiveSubs_' || p_datdeb || 'to' || p_datfin;
  wbody         := 'You will find the list in attached file. Best regards. K+';
  wcontent_type := 'text/html';
  wpj_body      := null;
  wpj.delete;
  wpj(1).directory_name := 'EXTRACT';
  wpj(1).file_name := wnomfichier;
  --------------------------------
  -- envoi du mail
  --------------------------------
  p_vn_mail.send_email(p_to           => wto,
                       p_from         => wfrom,
                       p_subj         => wsubj,
                       p_body         => wbody,
                       p_content_type => wcontent_type,
                       p_cc           => wcc,
                       p_pj           => wpj,
                       p_pj_body      => wpj_body);
  update usr_procedure
     set lmess = 'Extract done, please check mail box'
   where numproc = p_numproc;
  commit;
   EXCEPTION
        WHEN OTHERS THEN
        BEGIN
           -- \\192.168.170.2\share\IT Department\Extract\00file_large
          open rc for wquery;
          wfichier := utl_file.fopen_nchar('EXTRACT_SYN', wnomfichier, 'W');
          loop
            fetch rc
              into wline;
            exit when rc%notfound;
            -- DBMS_OUTPUT.PUT_LINE(wline || '     ' || 1);
            utl_file.put_line_nchar(wfichier, wline);
          end loop;
          close rc;
          utl_file.fclose(wfichier);
          wto:=trim(p_email);
          wfrom := 'statistic@vstv.vn';
          wcc   := 'pktuy@vstv.vn';
          wsubj := 'Extract_InactiveSubs_' || p_datdeb || 'to' || p_datfin;
          wbody := 'File create about after 15 minus at folder: \\192.168.170.2\share\IT Department\Extract\00file_large\<BR> File name: '||wnomfichier||'.<BR> Best regards. K+';


          wcontent_type :='text/html';
          wpj_body:=null;

          wpj.delete;
          p_vn_mail.send_email(p_to =>wto,p_from=>wfrom,p_subj =>wsubj,p_body=>wbody,p_content_type=>wcontent_type,p_cc=>wcc,p_pj=>wpj,p_pj_body=>wpj_body);
      update usr_procedure set lmess = 'Extract done, please check email box' where numproc = p_numproc;
      commit;
      END;
end Vn_extract_inactive_subs;
