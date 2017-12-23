create or replace procedure sp_payment_sch(p_applid number,
                                           p_amount number,
                                           p_out    out varchar2) is
  ln_amount     Number;
  total_Amt_Due Number;
begin
  ln_amount := p_amount;
  select sum(due_Amt) - sum(nvl(paid_Amt, 0))
    into total_Amt_Due
    from cust_policy_sch
   where applid = p_applid
     and paid_flag = 'N';
  if total_Amt_Due is null then
   total_Amt_Due := 0; 
  end if;
  if ln_amount > total_Amt_Due then
    p_out := 'Due amount is' || ' ' || total_Amt_Due || ' ' ||
             'Please enter the amount less than or equal to Due Amount';
    goto labell;
  end if;
  insert into CUST_POLICY_receipt
    (RECID, APPLID, PAY_DATE, PAY_AMT, MAKEDATE)
  values
    (recid.nextval, p_applid, sysdate, p_amount, sysdate);

  for x in (select c.*, c.due_amt - nvl(c.paid_amt, 0) amt_due
              from cust_policy_sch c
             where c.applid = p_applid
               and c.paid_flag = 'N'
             order by c.installment_no) loop
    if ln_amount > 0 then
      if ln_amount >= x.amt_due then
        update cust_policy_sch c
           set c.paid_amt = c.due_amt, c.paid_flag = 'Y'
         where c.schid = x.schid;
        ln_amount := ln_amount - x.amt_due;
      else
        update cust_policy_sch c
           set c.paid_amt  = ln_amount,
               c.paid_flag = case
                               when nvl(c.paid_amt, 0) = c.due_amt then
                                'Y'
                               else
                                'N'
                             end
         where c.schid = x.schid;
        ln_amount := 0;
      end if;
    end if;
  end loop;
  p_out := 'S';
  <<labell>>
  null;
exception
  when others then
    rollback;
end sp_payment_sch;
/
