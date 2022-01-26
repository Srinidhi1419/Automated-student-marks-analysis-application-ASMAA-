/*
SQLyog - Free MySQL GUI v5.0
Host - 5.0.16-nt : Database - vikas
*********************************************************************
Server version : 5.0.16-nt
*/


create database if not exists `vikas`;

USE `vikas`;

SET FOREIGN_KEY_CHECKS=0;

/*Table structure for table `allocate_subject` */

DROP TABLE IF EXISTS `allocate_subject`;

CREATE TABLE `allocate_subject` (
  `empid` varchar(50) NOT NULL,
  `ename` varchar(50) NOT NULL,
  `dept` varchar(50) NOT NULL,
  `year` varchar(50) NOT NULL,
  `sem` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  PRIMARY KEY  (`subject`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `attendance` */

DROP TABLE IF EXISTS `attendance`;

CREATE TABLE `attendance` (
  `htno` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  `h1` int(10) default NULL,
  `h2` int(10) default NULL,
  `h3` int(10) default NULL,
  `h4` int(10) default NULL,
  `h5` int(10) default NULL,
  `h6` int(10) default NULL,
  `h7` int(10) default NULL,
  `total` int(10) NOT NULL,
  `course` varchar(50) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `year` varchar(50) NOT NULL,
  `sem` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `delete_student` */

DROP TABLE IF EXISTS `delete_student`;

CREATE TABLE `delete_student` (
  `id` int(20) NOT NULL auto_increment,
  `htno` varchar(50) default NULL,
  `sname` varchar(50) default NULL,
  `year` varchar(50) default NULL,
  `sem` varchar(50) default NULL,
  `reason` varchar(400) default NULL,
  `promote` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `faculty` */

DROP TABLE IF EXISTS `faculty`;

CREATE TABLE `faculty` (
  `id` int(255) NOT NULL auto_increment,
  `empid` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `emno` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `ename` varchar(50) NOT NULL,
  `aadhar` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `doj` varchar(50) NOT NULL,
  `qual` varchar(50) NOT NULL,
  `design1` varchar(50) default NULL,
  `design2` varchar(50) default NULL,
  `design3` varchar(50) default NULL,
  `design4` varchar(50) default NULL,
  `course` varchar(100) NOT NULL,
  `dept` varchar(100) default NULL,
  `reg1` varchar(50) NOT NULL,
  `reg2` varchar(50) NOT NULL,
  `reg3` varchar(50) NOT NULL,
  `reg4` varchar(50) default NULL,
  `reg5` varchar(50) default NULL,
  `qual1` varchar(50) NOT NULL,
  `inst1` varchar(50) NOT NULL,
  `yop1` varchar(50) NOT NULL,
  `marks1` varchar(50) NOT NULL,
  `qual2` varchar(50) NOT NULL,
  `inst2` varchar(50) NOT NULL,
  `yop2` varchar(50) NOT NULL,
  `marks2` varchar(50) NOT NULL,
  `qual3` varchar(50) NOT NULL,
  `inst3` varchar(50) NOT NULL,
  `yop3` varchar(50) NOT NULL,
  `marks3` varchar(50) NOT NULL,
  `qual4` varchar(50) default NULL,
  `inst4` varchar(50) default NULL,
  `yop4` varchar(50) default NULL,
  `marks4` varchar(50) default NULL,
  `qual5` varchar(50) default NULL,
  `inst5` varchar(50) default NULL,
  `yop5` varchar(50) default NULL,
  `marks5` varchar(50) default NULL,
  `photo` longblob NOT NULL,
  PRIMARY KEY  (`id`,`empid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `incharge` */

DROP TABLE IF EXISTS `incharge`;

CREATE TABLE `incharge` (
  `dept` varchar(50) NOT NULL,
  `year` varchar(50) NOT NULL,
  `sem` varchar(50) NOT NULL,
  `empid` varchar(50) NOT NULL,
  `ename` varchar(50) NOT NULL,
  PRIMARY KEY  (`empid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `lab` */

DROP TABLE IF EXISTS `lab`;

CREATE TABLE `lab` (
  `course` varchar(50) NOT NULL,
  `year` varchar(50) NOT NULL,
  `sem` varchar(50) NOT NULL,
  `regul` varchar(50) NOT NULL,
  `bcode` varchar(50) NOT NULL,
  `htno` varchar(50) NOT NULL,
  `scode` varchar(50) NOT NULL,
  `marks` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `mid1` */

DROP TABLE IF EXISTS `mid1`;

CREATE TABLE `mid1` (
  `scode` varchar(50) NOT NULL default '',
  `sname` varchar(50) NOT NULL default '',
  `htno` varchar(50) NOT NULL default '',
  `m1` int(50) NOT NULL default '0',
  `sq1` int(50) NOT NULL default '0',
  `assign1` int(50) NOT NULL default '0',
  `sum1` int(50) NOT NULL default '0',
  `course` varchar(50) NOT NULL default '',
  `branch` varchar(50) NOT NULL default '',
  `year` varchar(50) NOT NULL default '',
  `sem` varchar(50) NOT NULL default ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `mid2` */

DROP TABLE IF EXISTS `mid2`;

CREATE TABLE `mid2` (
  `scode` varchar(50) NOT NULL,
  `sname` varchar(50) NOT NULL,
  `htno` varchar(50) NOT NULL,
  `m1` int(50) NOT NULL,
  `sq1` int(50) NOT NULL,
  `assign1` int(50) NOT NULL,
  `sum1` int(50) NOT NULL,
  `m2` int(50) NOT NULL,
  `sq2` int(50) NOT NULL,
  `assign2` int(50) NOT NULL,
  `sum2` int(50) NOT NULL,
  `grandsum` int(50) NOT NULL,
  `course` varchar(50) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `year` varchar(50) NOT NULL,
  `sem` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `nonfaculty` */

DROP TABLE IF EXISTS `nonfaculty`;

CREATE TABLE `nonfaculty` (
  `id` int(30) NOT NULL auto_increment,
  `empid` varchar(50) NOT NULL,
  `dob` varchar(50) NOT NULL default '',
  `emno` varchar(50) NOT NULL default '',
  `email` varchar(50) NOT NULL,
  `ename` varchar(50) NOT NULL default '',
  `aadhar` varchar(50) NOT NULL default '',
  `gender` varchar(50) NOT NULL default '',
  `doj` varchar(50) NOT NULL default '',
  `qual` varchar(50) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `course` varchar(100) NOT NULL default '',
  `dept` varchar(100) NOT NULL,
  `photo` longblob NOT NULL,
  `pass` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`,`empid`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `remarks` */

DROP TABLE IF EXISTS `remarks`;

CREATE TABLE `remarks` (
  `empid` varchar(50) NOT NULL,
  `ename` varchar(50) NOT NULL,
  `dept` varchar(50) NOT NULL,
  `remark` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `semester` */

DROP TABLE IF EXISTS `semester`;

CREATE TABLE `semester` (
  `sno` int(200) NOT NULL auto_increment,
  `course` varchar(100) NOT NULL,
  `year` varchar(100) NOT NULL,
  `sem` varchar(100) NOT NULL,
  `regul` varchar(100) NOT NULL,
  `htno` varchar(100) NOT NULL,
  `scode` varchar(100) NOT NULL,
  `sname` varchar(100) NOT NULL,
  `grade` varchar(100) NOT NULL,
  `credits` int(100) NOT NULL,
  `branch` varchar(100) NOT NULL,
  PRIMARY KEY  (`sno`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `staff_delete` */

DROP TABLE IF EXISTS `staff_delete`;

CREATE TABLE `staff_delete` (
  `empid` varchar(50) default NULL,
  `ename` varchar(50) default NULL,
  `dept` varchar(50) character set latin1 collate latin1_bin default NULL,
  `reason` varchar(260) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(255) NOT NULL auto_increment,
  `htno` varchar(50) NOT NULL,
  `sname` varchar(50) NOT NULL,
  `aadhar` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `foccup` varchar(50) NOT NULL,
  `mname` varchar(50) NOT NULL,
  `moccup` varchar(50) NOT NULL,
  `caste` varchar(50) NOT NULL,
  `stype` varchar(50) NOT NULL,
  `htype` varchar(50) NOT NULL,
  `cet` varchar(50) default NULL,
  `dob` varchar(50) NOT NULL,
  `blood` varchar(50) NOT NULL,
  `caddr` varchar(100) NOT NULL,
  `paddr` varchar(100) NOT NULL,
  `smno` varchar(50) NOT NULL,
  `pmno` varchar(50) NOT NULL,
  `plno` varchar(50) default NULL,
  `semail` varchar(50) NOT NULL,
  `pemail` varchar(50) default NULL,
  `ssc` varchar(50) NOT NULL,
  `inst1` varchar(50) NOT NULL,
  `yop1` varchar(50) NOT NULL,
  `marks1` varchar(50) NOT NULL,
  `inter` varchar(50) NOT NULL,
  `inst2` varchar(50) NOT NULL,
  `yop2` varchar(50) NOT NULL,
  `marks2` varchar(50) NOT NULL,
  `other` varchar(50) default NULL,
  `inst3` varchar(50) default NULL,
  `yop3` varchar(50) default NULL,
  `marks3` varchar(50) default NULL,
  `course` varchar(50) NOT NULL,
  `year` varchar(50) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `sem` varchar(50) NOT NULL,
  `regul` varchar(50) NOT NULL,
  `photo` longblob NOT NULL,
  `pass` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`,`htno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 MAX_ROWS=50 ROW_FORMAT=DYNAMIC COMMENT='InnoDB free: 15360 kB';

/*Table structure for table `subjects` */

DROP TABLE IF EXISTS `subjects`;

CREATE TABLE `subjects` (
  `scode` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `dept` varchar(50) NOT NULL,
  `year` varchar(50) NOT NULL,
  `sem` varchar(50) NOT NULL,
  PRIMARY KEY  (`scode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS=1;
