create or replace procedure sp_update_wkflw(p_applid in number,
                                            p_flag   in varchar2,
                                            p_out    out varchar2) is
  ln_cnt        number;
  lv_username   sys_user.userid%type;
  ln_employeeid number;
  lv_rolecode   workflow.rolecode%type;
  ln_loop_cnt   number := 1;
  ln_emp_cnt    number;
  ln_seq        workflow_Stage.Workflowseq%type;
  med_cnt       number;
  lv_stage      workflow.stage%type;
  wkflw_cnt     number;
  hold_cnt      number;
begin
  select count(1)
    into hold_cnt
    from Workflow_Stage s
   where s.applid = p_applid
     and s.stagestatus = 'H';

  if hold_cnt > 0 and p_flag = 'H' then
    GOTO label1;
  end if;
  if hold_cnt > 0 and p_flag = 'U' then
    update workflow_Stage s
       set s.stagestatus = 'P'
     where applid = p_applid
       and stagestatus = 'H';

    update workflow_Stage s
       set s.stagestatus = 'C', s.makedate = sysdate
     where applid = p_applid
       and stage = 'CUSTENTRY';
    GOTO label1;
  end if;

  if hold_cnt > 0 and p_flag = 'R' then
    update workflow_Stage s
       set s.stagestatus = 'J'
     where applid = p_applid
       and stagestatus = 'H';

    update workflow_Stage s
       set s.stagestatus = 'J', s.makedate = sysdate
     where applid = p_applid
       and stage = 'CUSTENTRY';
    GOTO label1;
  end if;

  if (p_flag = 'U') then
    select count(1)
      into ln_cnt
      from workflow_stage w
     where w.applid = p_applid;

    if ln_cnt = 0 then
      begin
        select s.userid
          into lv_username
          from global_t t, sys_user s
         where t.applid = p_applid
           and t.username = s.username;
      exception
        when others then
          lv_username := 'SYSTEM';
      end;
      select ws.rolecode, ws.stage
        into lv_rolecode, lv_stage
        from workflow ws
       where ws.WORKFLOWID = 1
         and ws.WORKFLOW_SEQ = 2;
      insert into workflow_Stage
        (WORKFLOWSTAGE_ID,
         APPLID,
         WORKFLOWID,
         STAGE,
         STAGESTATUS,
         EMPLOYEEID,
         MAKERID,
         MAKEDATE,
         WORKFLOWSEQ,
         isverified)
        (select WORKFLOWSTAGE_ID.NEXTVAL,
                p_applid,
                WORKFLOWID,
                ws.stage,
                'C',
                lv_username,
                lv_username,
                sysdate,
                WORKFLOW_SEQ,
                'T'
           from workflow ws
          where ws.WORKFLOWID = 1
            and ws.WORKFLOW_SEQ = 1);
      select count(1)
        into med_cnt
        from CUST_QUESTIONS s
       where s.applid = p_applid
         and s.answer = 'Y';
      if (lv_stage = 'L1MED' and med_cnt > 0) then
        select ws.rolecode
          into lv_rolecode
          from workflow ws
         where ws.WORKFLOWID = 1
           and ws.WORKFLOW_SEQ = 2;

        for x in (select count(w.workflowstage_id) cnt, c.employeeid
                    from company_emp_role c, workflow_Stage w
                   where c.rolecode = lv_rolecode
                     and w.employeeid(+) = c.employeeid
                     and w.stagestatus(+) in ('C', 'P')
                   group by c.employeeid) loop
          if ln_loop_cnt = 1 then
            ln_employeeid := x.employeeid;
            ln_emp_cnt    := x.cnt;
          end if;

          if ln_loop_cnt > 1 then
            if x.cnt < ln_emp_cnt then
              ln_employeeid := x.employeeid;
              ln_emp_cnt    := x.cnt;
            end if;
          end if;
          ln_loop_cnt := ln_loop_cnt + 1;
        end loop;
        insert into workflow_Stage
          (WORKFLOWSTAGE_ID,
           APPLID,
           WORKFLOWID,
           STAGE,
           STAGESTATUS,
           EMPLOYEEID,
           MAKERID,
           MAKEDATE,
           WORKFLOWSEQ,
           isverified)
          (select WORKFLOWSTAGE_ID.NEXTVAL,
                  p_applid,
                  WORKFLOWID,
                  ws.stage,
                  'R',
                  null,
                  null,
                  sysdate,
                  WORKFLOW_SEQ,
                  'T'
             from workflow ws
            where ws.WORKFLOWID = 1
              and ws.WORKFLOW_SEQ = 3);
        ln_seq := 2;
      end if;

      if (lv_stage = 'L1MED' and med_cnt = 0) then
        insert into workflow_Stage
          (WORKFLOWSTAGE_ID,
           APPLID,
           WORKFLOWID,
           STAGE,
           STAGESTATUS,
           EMPLOYEEID,
           MAKERID,
           MAKEDATE,
           WORKFLOWSEQ,
           isverified)
          (select WORKFLOWSTAGE_ID.NEXTVAL,
                  p_applid,
                  WORKFLOWID,
                  ws.stage,
                  'R',
                  null,
                  null,
                  sysdate,
                  WORKFLOW_SEQ,
                  'T'
             from workflow ws
            where ws.WORKFLOWID = 1
              and ws.WORKFLOW_SEQ = 2);
        ln_seq := 3;
        select ws.rolecode
          into lv_rolecode
          from workflow ws
         where ws.WORKFLOWID = 1
           and ws.WORKFLOW_SEQ = 3;

        for x in (select count(w.workflowstage_id) cnt, c.employeeid
                    from company_emp_role c, workflow_Stage w
                   where c.rolecode = lv_rolecode
                     and w.employeeid(+) = c.employeeid
                     and w.stagestatus(+) in ('C', 'P')
                   group by c.employeeid) loop
          if ln_loop_cnt = 1 then
            ln_employeeid := x.employeeid;
            ln_emp_cnt    := x.cnt;
          end if;

          if ln_loop_cnt > 1 then
            if x.cnt < ln_emp_cnt then
              ln_employeeid := x.employeeid;
              ln_emp_cnt    := x.cnt;
            end if;
          end if;
          ln_loop_cnt := ln_loop_cnt + 1;
        end loop;
      end if;

      if lv_stage <> 'L1MED' then
        begin
          ln_seq := 2;
          select ws.rolecode
            into lv_rolecode
            from workflow ws
           where ws.WORKFLOWID = 1
             and ws.WORKFLOW_SEQ = 2;

          for x in (select count(w.workflowstage_id) cnt, c.employeeid
                      from company_emp_role c, workflow_Stage w
                     where c.rolecode = lv_rolecode
                       and w.employeeid(+) = c.employeeid
                       and w.stagestatus(+) in ('C', 'P')
                     group by c.employeeid) loop
            if ln_loop_cnt = 1 then
              ln_employeeid := x.employeeid;
              ln_emp_cnt    := x.cnt;
            end if;

            if ln_loop_cnt > 1 then
              if x.cnt < ln_emp_cnt then
                ln_employeeid := x.employeeid;
                ln_emp_cnt    := x.cnt;
              end if;
            end if;
            ln_loop_cnt := ln_loop_cnt + 1;
          end loop;
        exception
          when no_data_found then
            null;
        end;
      end if;

      insert into workflow_Stage
        (WORKFLOWSTAGE_ID,
         APPLID,
         WORKFLOWID,
         STAGE,
         STAGESTATUS,
         EMPLOYEEID,
         MAKERID,
         MAKEDATE,
         WORKFLOWSEQ,
         isverified)
        (select WORKFLOWSTAGE_ID.NEXTVAL,
                p_applid,
                WORKFLOWID,
                ws.stage,
                'P',
                ln_employeeid,
                ln_employeeid,
                sysdate,
                WORKFLOW_SEQ,
                'F'
           from workflow ws
          where ws.WORKFLOWID = 1
            and ws.WORKFLOW_SEQ = ln_seq);

    else

      select max(Workflowseq)
        into ln_seq
        from workflow_Stage
       where applid = p_applid
         and stagestatus in ('P', 'R');
      begin
        select ws.stage
          into lv_stage
          from workflow ws
         where ws.workflowid = 1
           and ws.workflow_seq = ln_seq + 1;
      exception
        when no_data_found then
          null;
      end;
      if lv_stage = 'ISSUE' then
        sp_plot_schedule(p_applid);
      end if;
      update workflow_Stage s
         set s.stagestatus = 'C'
       where applid = p_applid
         and stagestatus = 'P';
      select count(1)
        into med_cnt
        from CUST_QUESTIONS s
       where s.applid = p_applid
         and trim(lower(s.answer)) = 'yes';
      if (lv_stage = 'L1MED' and med_cnt > 0) then
        select ws.rolecode
          into lv_rolecode
          from workflow ws
         where ws.WORKFLOWID = 1
           and ws.WORKFLOW_SEQ = ln_seq + 1;

        for x in (select count(w.workflowstage_id) cnt, c.employeeid
                    from company_emp_role c, workflow_Stage w
                   where c.rolecode = lv_rolecode
                     and w.employeeid(+) = c.employeeid
                     and w.stagestatus(+) in ('C', 'P')
                   group by c.employeeid) loop
          if ln_loop_cnt = 1 then
            ln_employeeid := x.employeeid;
            ln_emp_cnt    := x.cnt;
          end if;

          if ln_loop_cnt > 1 then
            if x.cnt < ln_emp_cnt then
              ln_employeeid := x.employeeid;
              ln_emp_cnt    := x.cnt;
            end if;
          end if;
          ln_loop_cnt := ln_loop_cnt + 1;
        end loop;
        insert into workflow_Stage
          (WORKFLOWSTAGE_ID,
           APPLID,
           WORKFLOWID,
           STAGE,
           STAGESTATUS,
           EMPLOYEEID,
           MAKERID,
           MAKEDATE,
           WORKFLOWSEQ,
           isverified)
          (select WORKFLOWSTAGE_ID.NEXTVAL,
                  p_applid,
                  WORKFLOWID,
                  ws.stage,
                  'R',
                  null,
                  null,
                  sysdate,
                  WORKFLOW_SEQ,
                  'T'
             from workflow ws
            where ws.WORKFLOWID = 1
              and ws.WORKFLOW_SEQ = ln_seq + 2);
      end if;

      if (lv_stage = 'L1MED' and med_cnt = 0) then
        insert into workflow_Stage
          (WORKFLOWSTAGE_ID,
           APPLID,
           WORKFLOWID,
           STAGE,
           STAGESTATUS,
           EMPLOYEEID,
           MAKERID,
           MAKEDATE,
           WORKFLOWSEQ,
           isverified)
          (select WORKFLOWSTAGE_ID.NEXTVAL,
                  p_applid,
                  WORKFLOWID,
                  ws.stage,
                  'R',
                  null,
                  null,
                  sysdate,
                  WORKFLOW_SEQ,
                  'T'
             from workflow ws
            where ws.WORKFLOWID = 1
              and ws.WORKFLOW_SEQ = ln_seq + 1);
        ln_seq := ln_seq + 1;
        select ws.rolecode
          into lv_rolecode
          from workflow ws
         where ws.WORKFLOWID = 1
           and ws.WORKFLOW_SEQ = ln_seq + 1;

        for x in (select count(w.workflowstage_id) cnt, c.employeeid
                    from company_emp_role c, workflow_Stage w
                   where c.rolecode = lv_rolecode
                     and w.employeeid(+) = c.employeeid
                     and w.stagestatus(+) in ('C', 'P')
                   group by c.employeeid) loop
          if ln_loop_cnt = 1 then
            ln_employeeid := x.employeeid;
            ln_emp_cnt    := x.cnt;
          end if;

          if ln_loop_cnt > 1 then
            if x.cnt < ln_emp_cnt then
              ln_employeeid := x.employeeid;
              ln_emp_cnt    := x.cnt;
            end if;
          end if;
          ln_loop_cnt := ln_loop_cnt + 1;
        end loop;
      end if;

      if lv_stage <> 'L1MED' then
        begin
          select ws.rolecode
            into lv_rolecode
            from workflow ws
           where ws.WORKFLOWID = 1
             and ws.WORKFLOW_SEQ = ln_seq + 1;

          for x in (select count(w.workflowstage_id) cnt, c.employeeid
                      from company_emp_role c, workflow_Stage w
                     where c.rolecode = lv_rolecode
                       and w.employeeid(+) = c.employeeid
                       and w.stagestatus(+) in ('C', 'P')
                     group by c.employeeid) loop
            if ln_loop_cnt = 1 then
              ln_employeeid := x.employeeid;
              ln_emp_cnt    := x.cnt;
            end if;

            if ln_loop_cnt > 1 then
              if x.cnt < ln_emp_cnt then
                ln_employeeid := x.employeeid;
                ln_emp_cnt    := x.cnt;
              end if;
            end if;
            ln_loop_cnt := ln_loop_cnt + 1;
          end loop;
        exception
          when no_data_found then
            null;
        end;
      end if;
      select count(1)
        into wkflw_cnt
        from workflow ws
       where ws.WORKFLOWID = 1
         and ws.WORKFLOW_SEQ = ln_seq + 1;
      if wkflw_cnt > 0 then
        insert into workflow_Stage
          (WORKFLOWSTAGE_ID,
           APPLID,
           WORKFLOWID,
           STAGE,
           STAGESTATUS,
           EMPLOYEEID,
           MAKERID,
           MAKEDATE,
           WORKFLOWSEQ,
           isverified)
          (select WORKFLOWSTAGE_ID.NEXTVAL,
                  p_applid,
                  WORKFLOWID,
                  ws.stage,
                  'P',
                  ln_employeeid,
                  ln_employeeid,
                  sysdate,
                  WORKFLOW_SEQ,
                  'F'
             from workflow ws
            where ws.WORKFLOWID = 1
              and ws.WORKFLOW_SEQ = ln_seq + 1);
      end if;

    end if;

  elsif (p_flag = 'R') then
    update workflow_Stage s
       set s.stagestatus = 'J'
     where applid = p_applid
       and stagestatus = 'P';
  elsif (p_flag = 'H') then
    update workflow_Stage s
       set s.stagestatus = 'H', s.isverified = 'F'
     where applid = p_applid
       and stagestatus = 'P';

    update workflow_Stage s
       set s.stagestatus = 'P', s.isverified = 'F'
     where applid = p_applid
       and stage = 'CUSTENTRY';
  end if;
  <<label1>>
  p_out := 'S';
exception
  when others then
    p_out := 'F';
end sp_update_wkflw;
/
