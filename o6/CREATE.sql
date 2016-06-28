create table dept(
  deptno int(2),
  dname  varchar(14),
  loc    varchar(13),
  constraint pk_dept primary key (deptno)
);
 
create table emp(
  empno    int(4),
  ename    varchar(10),
  job      varchar(9),
  mgr      int(4),
  hiredate date,
  sal      float(7,2),
  comm     float(7,2),
  deptno   int(2),
  constraint pk_emp primary key (empno),
  constraint fk_deptno foreign key (deptno) references dept (deptno)
);
 
/*
create table bonus(
  ename varchar2(10),
  job   varchar2(9),
  sal   number,
  comm  number
);
 
create table salgrade(
  grade number,
  losal number,
  hisal number
);
*/

insert into dept
values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept
values(20, 'RESEARCH', 'DALLAS');
insert into dept
values(30, 'SALES', 'CHICAGO');
insert into dept
values(40, 'OPERATIONS', 'BOSTON');
 
insert into emp
values(
 7839, 'KING', 'PRESIDENT', null,
 STR_TO_DATE('17-11-1981','dd-mm-yyyy'),
 5000, null, 10
);
insert into emp
values(
 7698, 'BLAKE', 'MANAGER', 7839,
 STR_TO_DATE('1-5-1981','dd-mm-yyyy'),
 2850, null, 30
);
insert into emp
values(
 7782, 'CLARK', 'MANAGER', 7839,
 STR_TO_DATE('9-6-1981','dd-mm-yyyy'),
 2450, null, 10
);
insert into emp
values(
 7566, 'JONES', 'MANAGER', 7839,
 STR_TO_DATE('2-4-1981','dd-mm-yyyy'),
 2975, null, 20
);
insert into emp
values(
 7788, 'SCOTT', 'ANALYST', 7566,
 STR_TO_DATE('13-JUL-87','dd-mm-rr') - 85,
 3000, null, 20
);
insert into emp
values(
 7902, 'FORD', 'ANALYST', 7566,
 STR_TO_DATE('3-12-1981','dd-mm-yyyy'),
 3000, null, 20
);
insert into emp
values(
 7369, 'SMITH', 'CLERK', 7902,
 STR_TO_DATE('17-12-1980','dd-mm-yyyy'),
 800, null, 20
);
insert into emp
values(
 7499, 'ALLEN', 'SALESMAN', 7698,
 STR_TO_DATE('20-2-1981','dd-mm-yyyy'),
 1600, 300, 30
);
insert into emp
values(
 7521, 'WARD', 'SALESMAN', 7698,
 STR_TO_DATE('22-2-1981','dd-mm-yyyy'),
 1250, 500, 30
);
insert into emp
values(
 7654, 'MARTIN', 'SALESMAN', 7698,
 STR_TO_DATE('28-9-1981','dd-mm-yyyy'),
 1250, 1400, 30
);
insert into emp
values(
 7844, 'TURNER', 'SALESMAN', 7698,
 STR_TO_DATE('8-9-1981','dd-mm-yyyy'),
 1500, 0, 30
);
insert into emp
values(
 7876, 'ADAMS', 'CLERK', 7788,
 STR_TO_DATE('13-JUL-87', 'dd-mm-rr') - 51,
 1100, null, 20
);
insert into emp
values(
 7900, 'JAMES', 'CLERK', 7698,
 STR_TO_DATE('3-12-1981','dd-mm-yyyy'),
 950, null, 30
);
insert into emp
values(
 7934, 'MILLER', 'CLERK', 7782,
 STR_TO_DATE('23-1-1982','dd-mm-yyyy'),
 1300, null, 10
);
 
/*
insert into salgrade
values (1, 700, 1200);
insert into salgrade
values (2, 1201, 1400);
insert into salgrade
values (3, 1401, 2000);
insert into salgrade
values (4, 2001, 3000);
insert into salgrade
values (5, 3001, 9999);
*/
 
commit;