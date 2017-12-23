insert into stage (STAGEID, STAGE, STAGEDESC, MAKERID, MAKEDATE)
values (1, 'CUSTENTRY', 'Customer Data Entry', 'SYSTEM', to_date('17-11-2017', 'dd-mm-yyyy'));

insert into stage (STAGEID, STAGE, STAGEDESC, MAKERID, MAKEDATE)
values (2, 'VERIFY', 'Customer Details Verification', 'SYSTEM', to_date('17-11-2017', 'dd-mm-yyyy'));

insert into stage (STAGEID, STAGE, STAGEDESC, MAKERID, MAKEDATE)
values (3, 'L1MED', 'Medical Underwriter Approval', 'SYSTEM', to_date('17-11-2017', 'dd-mm-yyyy'));

insert into stage (STAGEID, STAGE, STAGEDESC, MAKERID, MAKEDATE)
values (4, 'L1NONMED', 'Non Medical Underwriter Approval', 'SYSTEM', to_date('17-11-2017', 'dd-mm-yyyy'));

insert into stage (STAGEID, STAGE, STAGEDESC, MAKERID, MAKEDATE)
values (5, 'ISSUE', 'Issuance', 'SYSTEM', to_date('17-11-2017', 'dd-mm-yyyy'));

insert into stage (STAGEID, STAGE, STAGEDESC, MAKERID, MAKEDATE)
values (6, 'PAY', 'Payment', 'SYSTEM', to_date('02-12-2017', 'dd-mm-yyyy'));

insert into role (ROLEID, ROLENAME, ROLEDESC, MAKERID, MAKEDATE)
values (1, 'CUST', 'Customer Data Entry', 'SYSTEM', to_date('24-11-2017', 'dd-mm-yyyy'));

insert into role (ROLEID, ROLENAME, ROLEDESC, MAKERID, MAKEDATE)
values (2, 'VER', 'Data Verification', 'SYSTEM', to_date('24-11-2017', 'dd-mm-yyyy'));

insert into role (ROLEID, ROLENAME, ROLEDESC, MAKERID, MAKEDATE)
values (3, 'L1MEDAPPR', 'Underwriter Medical Approval', 'SYSTEM', to_date('24-11-2017', 'dd-mm-yyyy'));

insert into role (ROLEID, ROLENAME, ROLEDESC, MAKERID, MAKEDATE)
values (4, 'L1NMEDAPPR', 'Underwriter Non Medical Approval', 'SYSTEM', to_date('24-11-2017', 'dd-mm-yyyy'));

insert into role (ROLEID, ROLENAME, ROLEDESC, MAKERID, MAKEDATE)
values (5, 'ISSUE', 'Policy Approval', 'SYSTEM', to_date('24-11-2017', 'dd-mm-yyyy'));

insert into role (ROLEID, ROLENAME, ROLEDESC, MAKERID, MAKEDATE)
values (6, 'PAY', 'Payment', 'SYSTEM', to_date('02-12-2017', 'dd-mm-yyyy'));

insert into products (PRODUCTID, PRODUCTNAME, PRODUCTDESC, PRODUCTMINLIMIT, PRODUCTMAXLIMIT, PRODUCTTENURE, MAKEDATE, MAKERID)
values (1, 'LIC', 'LIC Health Plan', 5000, 1000000, 6, to_date('25-11-2017', 'dd-mm-yyyy'), 'SYSTEM');

insert into products (PRODUCTID, PRODUCTNAME, PRODUCTDESC, PRODUCTMINLIMIT, PRODUCTMAXLIMIT, PRODUCTTENURE, MAKEDATE, MAKERID)
values (6, 'BHIMA', 'Jiwan Bhima', 1000, 10000000, 7, to_date('25-11-2017', 'dd-mm-yyyy'), 'SYSTEM');

insert into sys_user (USERID, USERNAME, PASSWORD, USERTYPE, MAKEDATE, MAKERID, STATUS)
values (1, 'KEDAR', 'KEDAR', 'VER', to_date('25-11-2017', 'dd-mm-yyyy'), 'SYSTEM', 'false');

insert into sys_user (USERID, USERNAME, PASSWORD, USERTYPE, MAKEDATE, MAKERID, STATUS)
values (2, 'SHRI', 'SHRI', 'VER', to_date('25-11-2017', 'dd-mm-yyyy'), 'SYSTEM', 'false');

insert into sys_user (USERID, USERNAME, PASSWORD, USERTYPE, MAKEDATE, MAKERID, STATUS)
values (3, 'VINIT', 'VINIT', 'L1MEDAPPR', to_date('25-11-2017', 'dd-mm-yyyy'), 'SYSTEM', 'false');

insert into sys_user (USERID, USERNAME, PASSWORD, USERTYPE, MAKEDATE, MAKERID, STATUS)
values (4, 'ULUGBECK', 'ULUGBECK', 'L1MEDAPPR', to_date('25-11-2017', 'dd-mm-yyyy'), 'SYSTEM', 'false');

insert into sys_user (USERID, USERNAME, PASSWORD, USERTYPE, MAKEDATE, MAKERID, STATUS)
values (5, 'ABHISHEK', 'ABHISHEK', 'L1NMEDAPPR', to_date('25-11-2017', 'dd-mm-yyyy'), 'SYSTEM', 'false');

insert into sys_user (USERID, USERNAME, PASSWORD, USERTYPE, MAKEDATE, MAKERID, STATUS)
values (6, 'ANURAG', 'ANURAG', 'L1NMEDAPPR', to_date('25-11-2017', 'dd-mm-yyyy'), 'SYSTEM', 'false');

insert into sys_user (USERID, USERNAME, PASSWORD, USERTYPE, MAKEDATE, MAKERID, STATUS)
values (7, 'KAUSHAL', 'KAUSHAL', 'ISSUE', to_date('25-11-2017', 'dd-mm-yyyy'), 'SYSTEM', 'false');

insert into sys_user (USERID, USERNAME, PASSWORD, USERTYPE, MAKEDATE, MAKERID, STATUS)
values (8, 'TARKIT', 'TARKIT', 'ISSUE', to_date('25-11-2017', 'dd-mm-yyyy'), 'SYSTEM', 'false');

insert into sys_user (USERID, USERNAME, PASSWORD, USERTYPE, MAKEDATE, MAKERID, STATUS)
values (27, 'KUNAL', 'KUNAL', 'PAY', to_date('01-12-2017', 'dd-mm-yyyy'), null, 'false');

insert into workflow (WORKFLOWSTAGEID, WORKFLOWID, WORKFLOWNAME, WORKFLOW_SEQ, STAGE, ROLECODE, MAKERID, MAKEDATE)
values (1, 1, 'Policy Issuance', 1, 'CUSTENTRY', 'CUST', 'SYSTEM', to_date('24-11-2017', 'dd-mm-yyyy'));

insert into workflow (WORKFLOWSTAGEID, WORKFLOWID, WORKFLOWNAME, WORKFLOW_SEQ, STAGE, ROLECODE, MAKERID, MAKEDATE)
values (2, 1, 'Policy Issuance', 2, 'VERIFY', 'VER', 'SYSTEM', to_date('24-11-2017', 'dd-mm-yyyy'));

insert into workflow (WORKFLOWSTAGEID, WORKFLOWID, WORKFLOWNAME, WORKFLOW_SEQ, STAGE, ROLECODE, MAKERID, MAKEDATE)
values (3, 1, 'Policy Issuance', 3, 'L1MED', 'L1MEDAPPR', 'SYSTEM', to_date('24-11-2017', 'dd-mm-yyyy'));

insert into workflow (WORKFLOWSTAGEID, WORKFLOWID, WORKFLOWNAME, WORKFLOW_SEQ, STAGE, ROLECODE, MAKERID, MAKEDATE)
values (4, 1, 'Policy Issuance', 4, 'L1NONMED', 'L1NMEDAPPR', 'SYSTEM', to_date('24-11-2017', 'dd-mm-yyyy'));

insert into workflow (WORKFLOWSTAGEID, WORKFLOWID, WORKFLOWNAME, WORKFLOW_SEQ, STAGE, ROLECODE, MAKERID, MAKEDATE)
values (5, 1, 'Policy Issuance', 5, 'ISSUE', 'ISSUE', 'SYSTEM', to_date('24-11-2017', 'dd-mm-yyyy'));

insert into workflow (WORKFLOWSTAGEID, WORKFLOWID, WORKFLOWNAME, WORKFLOW_SEQ, STAGE, ROLECODE, MAKERID, MAKEDATE)
values (6, 1, 'Policy Issuance', 6, 'PAY', 'PAY', 'SYSTEM', to_date('24-11-2017', 'dd-mm-yyyy'));

insert into company_emp_role (CEMPID, ROLECODE, EMPLOYEEID, MAKERID, MAKEDATE)
values (1, 'VER', 1, 'SYSTEMM', to_date('25-11-2017', 'dd-mm-yyyy'));

insert into company_emp_role (CEMPID, ROLECODE, EMPLOYEEID, MAKERID, MAKEDATE)
values (2, 'VER', 2, 'SYSTEMM', to_date('25-11-2017', 'dd-mm-yyyy'));

insert into company_emp_role (CEMPID, ROLECODE, EMPLOYEEID, MAKERID, MAKEDATE)
values (3, 'L1MEDAPPR', 3, 'SYSTEMM', to_date('25-11-2017', 'dd-mm-yyyy'));

insert into company_emp_role (CEMPID, ROLECODE, EMPLOYEEID, MAKERID, MAKEDATE)
values (4, 'L1MEDAPPR', 4, 'SYSTEMM', to_date('25-11-2017', 'dd-mm-yyyy'));

insert into company_emp_role (CEMPID, ROLECODE, EMPLOYEEID, MAKERID, MAKEDATE)
values (5, 'L1NMEDAPPR', 5, 'SYSTEMM', to_date('25-11-2017', 'dd-mm-yyyy'));

insert into company_emp_role (CEMPID, ROLECODE, EMPLOYEEID, MAKERID, MAKEDATE)
values (6, 'L1NMEDAPPR', 6, 'SYSTEMM', to_date('25-11-2017', 'dd-mm-yyyy'));

insert into company_emp_role (CEMPID, ROLECODE, EMPLOYEEID, MAKERID, MAKEDATE)
values (7, 'ISSUE', 7, 'SYSTEMM', to_date('25-11-2017', 'dd-mm-yyyy'));

insert into company_emp_role (CEMPID, ROLECODE, EMPLOYEEID, MAKERID, MAKEDATE)
values (8, 'ISSUE', 8, 'SYSTEMM', to_date('25-11-2017', 'dd-mm-yyyy'));

insert into company_emp_role (CEMPID, ROLECODE, EMPLOYEEID, MAKERID, MAKEDATE)
values (9, 'PAY', 27, 'SYSTEMM', to_date('25-11-2017', 'dd-mm-yyyy'));