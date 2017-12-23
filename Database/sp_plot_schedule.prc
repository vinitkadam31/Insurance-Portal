create or replace procedure sp_plot_schedule(p_applid number) is
  lv_freq        cust_policy_details.frequency%type;
  lv_frequency   number;
  no_of_years    number;
  ln_installment number;
  ln_amt         cust_policy_details.amtrequested%type;
  ln_ins_amt     cust_policy_details.amtrequested%type;
  loop_cnt       number := 1;
  lv_Date        date;
  i              number := 1;
begin
  begin
    select p.frequency, p.policyterm * 12, (p.amtrequested * 50) / 100
      into lv_freq, no_of_years, ln_amt
      from cust_policy_details p
     where p.applid = p_applid;
  exception
    when others then
      lv_freq     := 'M';
      no_of_years := 2;
  end;

  lv_frequency := case
                    when lv_freq = 'M' then
                     1
                    when lv_freq = 'Q' then
                     3
                    when lv_freq = 'Y' then
                     12
                    when lv_freq = 'H' then
                     6
                  end;

  ln_installment := no_of_years / lv_frequency;
  ln_ins_amt     := round((ln_amt / ln_installment), 2);

  while (ln_installment > 0) loop
    ln_amt := ln_amt - ln_ins_amt;
    if loop_cnt = 1 then
      lv_Date := add_months(trunc(sysdate) -
                            (to_number(to_char(sysdate, 'DD')) - 1),
                            1) - 1;
      insert into cust_policy_sch
        (SCHID,
         APPLID,
         DUE_DATE,
         INSTALLMENT_NO,
         DUE_AMT,
         PAID_AMT,
         PAID_FLAG)
      values
        (schid.nextval, p_applid, lv_Date, i, ln_ins_amt, 0, 'N');
      loop_cnt := 0;
    else
      insert into cust_policy_sch
        (SCHID,
         APPLID,
         DUE_DATE,
         INSTALLMENT_NO,
         DUE_AMT,
         PAID_AMT,
         PAID_FLAG)
      values
        (schid.nextval,
         p_applid,
         add_months(lv_Date, lv_frequency),
         i,
         case when ln_installment = 1 then ln_ins_amt + nvl(ln_amt, 0) else
         ln_ins_amt end,
         0,
         'N')
      returning due_Date into lv_Date;
    end if;
    i              := i + 1;
    ln_installment := ln_installment - 1;
  end loop;
exception
  when others then
    null;
end sp_plot_schedule;
/
