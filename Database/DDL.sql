-- Create table
create table SYS_USER
(
  userid   NUMBER(10) not null,
  username VARCHAR2(200),
  password VARCHAR2(200),
  usertype VARCHAR2(200),
  makedate DATE,
  makerid  VARCHAR2(200),
  status   VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_USER
  add constraint PK_USERID primary key (USERID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

  -- Create table
create table PRODUCTS
(
  productid       NUMBER(10) not null,
  productname     VARCHAR2(200),
  productdesc     VARCHAR2(200),
  productminlimit NUMBER(10),
  productmaxlimit NUMBER(10),
  producttenure   NUMBER(10),
  makedate        DATE,
  makerid         VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table PRODUCTS
  add constraint PK_PRODUCTID primary key (PRODUCTID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

  -- Create table
create table STAGE
(
  stageid   NUMBER(10) not null,
  stage     VARCHAR2(200),
  stagedesc VARCHAR2(200),
  makerid   VARCHAR2(200),
  makedate  DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table STAGE
  add constraint PK_STAGE primary key (STAGEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STAGE
  add constraint UK_STAGE unique (STAGE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

  -- Create table
create table ROLE
(
  roleid   NUMBER(10) not null,
  rolename VARCHAR2(200),
  roledesc VARCHAR2(200),
  makerid  VARCHAR2(200),
  makedate DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table ROLE
  add constraint PK_ROLEID primary key (ROLEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROLE
  add constraint UK_ROLENAME unique (ROLENAME)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

  -- Create table
create table WORKFLOW
(
  workflowstageid NUMBER(10) not null,
  workflowid      NUMBER(10) not null,
  workflowname    VARCHAR2(200),
  workflow_seq    NUMBER(10),
  stage           VARCHAR2(200),
  rolecode        VARCHAR2(200),
  makerid         VARCHAR2(200),
  makedate        DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table WORKFLOW
  add constraint PK_WORKFLOWSTAGEID primary key (WORKFLOWSTAGEID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

  -- Create table
create table WORKFLOW_STAGE
(
  workflowstage_id NUMBER(10) not null,
  applid           NUMBER(10) not null,
  workflowid       NUMBER(10),
  stage            VARCHAR2(200),
  stagestatus      VARCHAR2(10),
  employeeid       NUMBER,
  makerid          VARCHAR2(200),
  makedate         DATE,
  workflowseq      NUMBER,
  isverified       VARCHAR2(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table WORKFLOW_STAGE
  add constraint PK_WORKFLOWSTAGE_ID primary key (WORKFLOWSTAGE_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WORKFLOW_STAGE
  add constraint FK_APPLID_WKFLW foreign key (APPLID)
  references GLOBAL_T (APPLID);

  -- Create table
create table COMPANY_EMP_ROLE
(
  cempid     NUMBER(10) not null,
  rolecode   VARCHAR2(200),
  employeeid NUMBER,
  makerid    VARCHAR2(200),
  makedate   DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table COMPANY_EMP_ROLE
  add constraint PK_CEMPID primary key (CEMPID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table COMPANY_EMP_ROLE
  add constraint FK_EMPLOYEEID foreign key (EMPLOYEEID)
  references SYS_USER (USERID);

  -- Create table
create table GLOBAL_T
(
  applid    NUMBER(10) not null,
  username  VARCHAR2(50),
  name      VARCHAR2(100),
  dob       DATE,
  contactno NUMBER(30),
  gender    VARCHAR2(200),
  address1  VARCHAR2(200),
  address2  VARCHAR2(200),
  city      VARCHAR2(200),
  state     VARCHAR2(200),
  country   VARCHAR2(200),
  pincode   NUMBER(30)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table GLOBAL_T
  add constraint PK_APPLID primary key (APPLID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

  -- Create table
create table CUST_QUESTIONS
(
  applid     NUMBER(10) not null,
  questionno NUMBER(10),
  answer     VARCHAR2(200),
  makerid    VARCHAR2(200),
  makedate   DATE,
  text       VARCHAR2(1000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table CUST_QUESTIONS
  add constraint FK_QUEST_APPLID foreign key (APPLID)
  references GLOBAL_T (APPLID);

  -- Create table
create table CUST_POLICY_SCH
(
  schid          NUMBER(10) not null,
  applid         NUMBER(10),
  due_date       DATE,
  installment_no NUMBER,
  due_amt        NUMBER(10,2),
  paid_amt       NUMBER(10,2),
  paid_flag      VARCHAR2(1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table CUST_POLICY_SCH
  add constraint PK_SCHID primary key (SCHID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CUST_POLICY_SCH
  add constraint FK_SCH_APPLID foreign key (APPLID)
  references GLOBAL_T (APPLID);

  -- Create table
create table CUSTOMER_DETAILS
(
  customerid NUMBER(10) not null,
  applid     NUMBER(10) not null,
  name       VARCHAR2(200),
  dob        DATE,
  contactno  NUMBER(30),
  emailid    VARCHAR2(200),
  gender     VARCHAR2(200),
  makerid    VARCHAR2(200),
  makedate   DATE,
  cust_type  VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table CUSTOMER_DETAILS
  add constraint PK_CUSTID primary key (CUSTOMERID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CUSTOMER_DETAILS
  add constraint FK_CUST_APPLID foreign key (APPLID)
  references GLOBAL_T (APPLID);

  -- Create table
create table CUST_POLICY_DETAILS
(
  policyid          NUMBER(10) not null,
  applid            NUMBER(10) not null,
  productid         NUMBER(10),
  amtrequested      NUMBER(10),
  policyterm        NUMBER(10),
  frequency         VARCHAR2(200),
  annual_income     NUMBER(10),
  smoke             VARCHAR2(200),
  height            VARCHAR2(200),
  weight            VARCHAR2(200),
  makerid           VARCHAR2(200),
  makedate          DATE,
  remarks           VARCHAR2(2000),
  prev_amtrequested NUMBER(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table CUST_POLICY_DETAILS
  add constraint PK_POLICYID primary key (POLICYID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CUST_POLICY_DETAILS
  add constraint FK_POLICY_APPLID foreign key (APPLID)
  references GLOBAL_T (APPLID);
alter table CUST_POLICY_DETAILS
  add constraint FK_PRODUCTID foreign key (PRODUCTID)
  references PRODUCTS (PRODUCTID);

  -- Create table
create table CUST_POLICY_RECEIPT
(
  recid    NUMBER(10) not null,
  applid   NUMBER(10),
  pay_date DATE,
  pay_amt  NUMBER(10),
  makedate DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table CUST_POLICY_RECEIPT
  add constraint PK_RECID primary key (RECID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CUST_POLICY_RECEIPT
  add constraint FK_RECID foreign key (APPLID)
  references GLOBAL_T (APPLID);

  -- Create sequence 
create sequence APPLID
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

-- Create sequence 
create sequence CUSTID
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

-- Create sequence 
create sequence POLICYID
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

-- Create sequence 
create sequence PRODUCTID
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

-- Create sequence 
create sequence RECID
minvalue 1
maxvalue 999999999999999999999999999
start with 41
increment by 1
cache 20;

-- Create sequence 
create sequence SCHID
minvalue 1
maxvalue 999999999999999999999999999
start with 161
increment by 1
cache 20;

-- Create sequence 
create sequence USERID
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;
	 
-- Create sequence 
create sequence WORKFLOWSTAGE_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 101
increment by 1
cache 20;

