

CREATE DATABASE IF NOT EXISTS `Pulse360Db` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `Pulse360Db`; 
SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` VARCHAR(150) NOT NULL,
  `ProductVersion` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Activity` (
  `ActivityId` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(100) NOT NULL,
  `ActivityType` VARCHAR(50) NOT NULL,
  `DueDate` DATETIME NOT NULL,
  `Owner` VARCHAR(100) NOT NULL,
  `CreatedDate` DATETIME NOT NULL,
  `Description` LONGTEXT NOT NULL,
  `Status` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ActivityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `addAdminDocNames` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `DocName` LONGTEXT NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `addEmployeeDocNames` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `DocName` LONGTEXT NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `AdminDocuments` (
  `AdminDocId` INT NOT NULL AUTO_INCREMENT,
  `Email` LONGTEXT NOT NULL,
  `DocName` LONGTEXT NOT NULL,
  `DocFile` LONGTEXT NOT NULL,
  PRIMARY KEY (`AdminDocId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `AllProjects` (
  `ProjectId` INT NOT NULL AUTO_INCREMENT,
  `ProjectName` VARCHAR(255) NOT NULL,
  `ClientName` VARCHAR(255) NOT NULL,
  `Description` VARCHAR(1000) NOT NULL,
  `StartDate` DATETIME NOT NULL,
  `EndDate` DATETIME NOT NULL,
  `Priority` VARCHAR(50) NOT NULL,
  `ProjectValue` DOUBLE NOT NULL,
  `PriceType` VARCHAR(50) NOT NULL,
  `FilePath` VARCHAR(255) NOT NULL,
  `LogoPath` VARCHAR(255) NOT NULL,
  `Status` VARCHAR(50) NOT NULL,
  `ManagerName` LONGTEXT NOT NULL,
  PRIMARY KEY (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Attendance` (
  `AttendanceId` INT NOT NULL AUTO_INCREMENT,
  `UserId` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  `CheckIn` DATETIME NULL,
  `CheckOut` DATETIME NULL,
  `LunchIn` DATETIME NULL,
  `LunchOut` DATETIME NULL,
  `WorkingHours` DECIMAL(18, 2) NOT NULL,
  `ProductionHours` DECIMAL(18, 2) NOT NULL,
  `OvertimeHours` DECIMAL(18, 2) NOT NULL,
  `BreakHours` DECIMAL(18, 2) NOT NULL,
  `Late` INT NOT NULL,
  `Status` LONGTEXT NOT NULL,
  PRIMARY KEY (`AttendanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Categories` (
  `CategoryId` INT NOT NULL AUTO_INCREMENT,
  `CategoryName` LONGTEXT NOT NULL,
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Deduction` (
  `DeductionId` INT NOT NULL AUTO_INCREMENT,
  `DeductionTypeId` INT NOT NULL,
  `DepartmentId` INT NOT NULL,
  `DesignationId` INT NOT NULL,
  `DeductionPercentage` DECIMAL(5, 2) NOT NULL,
  `CreatedAt` DATETIME NOT NULL,
  `CreatedBy` LONGTEXT NULL,
  `ModifiedAt` DATETIME NULL,
  `ModifiedBy` LONGTEXT NULL,
  PRIMARY KEY (`DeductionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `DeductionType` (
  `DeductionTypeId` INT NOT NULL AUTO_INCREMENT,
  `DeductionsName` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`DeductionTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `DepartmentLeaves` (
  `DepartmentLeavesId` INT NOT NULL AUTO_INCREMENT,
  `DepartmentId` INT NOT NULL,
  `LeaveTypeId` INT NOT NULL,
  `LeavesCount` INT NOT NULL,
  `Status` LONGTEXT NOT NULL,
  PRIMARY KEY (`DepartmentLeavesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Departments` (
  `DepartmentId` INT NOT NULL AUTO_INCREMENT,
  `Name` LONGTEXT NOT NULL,
  `NoOfEmployee` INT NULL,
  `Status` LONGTEXT NOT NULL,
  `CreatedAt` DATETIME NULL,
  `CreatedBy` VARCHAR(255) NULL,
  `ModifiedBy` VARCHAR(255) NULL,
  `ModifiedAt` DATETIME NULL,
  PRIMARY KEY (`DepartmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Designations` (
  `DesignationId` INT NOT NULL AUTO_INCREMENT,
  `DepartmentId` INT NOT NULL,
  `Name` LONGTEXT NOT NULL,
  `NoOfEmployee` INT NULL,
  `status` LONGTEXT NOT NULL,
  `CreatedAt` DATETIME NULL,
  `CreatedBy` VARCHAR(255) NULL,
  `ModifiedBy` VARCHAR(255) NULL,
  `ModifiedAt` DATETIME NULL,
  PRIMARY KEY (`DesignationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Earning` (
  `EarningsId` INT NOT NULL AUTO_INCREMENT,
  `EarntypeId` INT NOT NULL,
  `EarningsPercentage` DECIMAL(18, 2) NOT NULL,
  `DepartmentId` INT NOT NULL,
  `DesignationId` INT NOT NULL,
  `CreatedBy` LONGTEXT NULL,
  `CreatedAt` DATETIME NULL,
  `ModifiedBy` LONGTEXT NULL,
  `ModifiedAt` DATETIME NULL,
  PRIMARY KEY (`EarningsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `EarningType` (
  `EarntypeId` INT NOT NULL AUTO_INCREMENT,
  `EarningName` LONGTEXT NOT NULL,
  PRIMARY KEY (`EarntypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `EducationDetails` (
  `EducationDetailsId` INT NOT NULL AUTO_INCREMENT,
  `EducationType` LONGTEXT NOT NULL,
  `UniversityName` LONGTEXT NOT NULL,
  `UserId` INT NOT NULL,
  `startdate` DATETIME NULL,
  `enddate` DATETIME NULL,
  PRIMARY KEY (`EducationDetailsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `EmployeeBankDetails` (
  `BankDetailId` INT NOT NULL AUTO_INCREMENT,
  `BankName` LONGTEXT NOT NULL,
  `AccountNumber` LONGTEXT NOT NULL,
  `IFSCCode` LONGTEXT NOT NULL,
  `BranchName` LONGTEXT NOT NULL,
  `UserId` INT NOT NULL,
  PRIMARY KEY (`BankDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `EmployeeDeductions` (
  `EmployeeDeductionId` INT NOT NULL AUTO_INCREMENT,
  `SalaryId` INT NOT NULL,
  `UserId` INT NOT NULL,
  `DeductionId` INT NOT NULL,
  `DeductionAmount` DECIMAL(18, 2) NOT NULL,
  PRIMARY KEY (`EmployeeDeductionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `EmployeeEarnings` (
  `EmployeeEarningId` INT NOT NULL AUTO_INCREMENT,
  `SalaryId` INT NOT NULL,
  `UserId` INT NOT NULL,
  `EarningId` INT NOT NULL,
  `EarningAmount` DECIMAL(18, 2) NOT NULL,
  PRIMARY KEY (`EmployeeEarningId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `EmployeeFamilyDetails` (
  `FamilyDetailId` INT NOT NULL AUTO_INCREMENT,
  `Name` LONGTEXT NOT NULL,
  `Relation` LONGTEXT NOT NULL,
  `DateOfBirth` DATETIME NOT NULL,
  `phone` LONGTEXT NOT NULL,
  `UserId` INT NOT NULL,
  PRIMARY KEY (`FamilyDetailId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `EmployeePerformances` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` LONGTEXT NOT NULL,
  `Department` LONGTEXT NOT NULL,
  `EmployeeId` INT NOT NULL,
  `Designation` LONGTEXT NOT NULL,
  `DateofJoin` DATETIME NOT NULL,
  `ROName` LONGTEXT NOT NULL,
  `DateofConfirmation` DATETIME NOT NULL,
  `RODesignation` LONGTEXT NOT NULL,
  `Qualification` LONGTEXT NOT NULL,
  `PreviousyearsofExp` INT NOT NULL,
  `Category` LONGTEXT NOT NULL,
  `Sub_Category` LONGTEXT NOT NULL,
  `Weightage` INT NULL,
  `Percentage_Achieved_Self` DECIMAL(18, 2) NULL,
  `Points_Scored_Self` INT NOT NULL,
  `Percentage_Achieved_RO` DECIMAL(18, 2) NULL,
  `Points_Scored_RO` INT NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `EmployeeSalaries` (
  `SalaryId` INT NOT NULL AUTO_INCREMENT,
  `UserId` INT NOT NULL,
  `TotalSalary` DECIMAL(18, 2) NOT NULL,
  `NetSalary` DECIMAL(18, 2) NOT NULL,
  `CreatedDate` DATETIME NOT NULL,
  `UpdatedDate` DATETIME NULL,
  PRIMARY KEY (`SalaryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Events` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Title` LONGTEXT NOT NULL,
  `Date` LONGTEXT NOT NULL,
  `EventTypeId` INT NOT NULL,
  `Status` LONGTEXT NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `EventTypes` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) NOT NULL,
  `Color` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Experience` (
  `ExperienceId` INT NOT NULL AUTO_INCREMENT,
  `DesignationName` LONGTEXT NOT NULL,
  `FromDate` DATETIME NOT NULL,
  `ToDate` DATETIME NOT NULL,
  `UserId` INT NOT NULL,
  `CompanyName` VARCHAR(100) NULL,
  PRIMARY KEY (`ExperienceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `FileUploads` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `FileName` LONGTEXT NOT NULL,
  `FilePath` LONGTEXT NOT NULL,
  `UserId` INT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `GoalTrackingList` (
  `GoalTrackingId` INT NOT NULL AUTO_INCREMENT,
  `Subject` LONGTEXT NOT NULL,
  `TargetAchievement` LONGTEXT NOT NULL,
  `StartDate` DATETIME NOT NULL,
  `EndDate` DATETIME NOT NULL,
  `Description` LONGTEXT NOT NULL,
  `Status` LONGTEXT NOT NULL,
  `GoalId` INT NOT NULL,
  PRIMARY KEY (`GoalTrackingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `GoalTypeList` (
  `GoalId` INT NOT NULL AUTO_INCREMENT,
  `GoalType` LONGTEXT NOT NULL,
  `Description` LONGTEXT NOT NULL,
  `Status` LONGTEXT NOT NULL,
  PRIMARY KEY (`GoalId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `KnowledgeBaseTopics` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `MasterTopic` LONGTEXT NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `LeaveBalances` (
  `LeaveBalanceId` INT NOT NULL AUTO_INCREMENT,
  `UserId` INT NOT NULL,
  `DepartmentLeavesId` INT NOT NULL,
  `LeaveTypeId` INT NOT NULL,
  `TotalLeaves` INT NOT NULL,
  `UsedLeaves` INT NOT NULL,
  PRIMARY KEY (`LeaveBalanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `LeaveRequests` (
  `LeaveRequestId` INT NOT NULL AUTO_INCREMENT,
  `UserId` INT NOT NULL,
  `LeaveTypeId` INT NOT NULL,
  `StartDate` DATETIME NOT NULL,
  `EndDate` DATETIME NOT NULL,
  `NumberOfDays` INT NOT NULL,
  `Reason` LONGTEXT NOT NULL,
  `ApprovedBy` LONGTEXT NOT NULL,
  `Status` LONGTEXT NOT NULL,
  `StatusHistory` LONGTEXT NOT NULL,
  PRIMARY KEY (`LeaveRequestId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `MasterIndicators` (
  `MasterIndicatorId` INT NOT NULL AUTO_INCREMENT,
  `MasterIndicatorType` LONGTEXT NOT NULL,
  `MasterIndicatorName` LONGTEXT NOT NULL,
  `Status` LONGTEXT NOT NULL,
  PRIMARY KEY (`MasterIndicatorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `MasterLeaveTypes` (
  `LeaveTypeId` INT NOT NULL AUTO_INCREMENT,
  `LeaveType` LONGTEXT NOT NULL,
  PRIMARY KEY (`LeaveTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Organization` (
  `OrganizationId` INT NOT NULL AUTO_INCREMENT,
  `OrganizationName` VARCHAR(100) NOT NULL,
  `OrganizationDescription` VARCHAR(500) NOT NULL,
  `OrganizationAddress` LONGTEXT NOT NULL,
  `OrganizationPhone` LONGTEXT NOT NULL,
  `OrganizationEmail` LONGTEXT NOT NULL,
  `OrganizationLogo` LONGTEXT NOT NULL,
  PRIMARY KEY (`OrganizationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Payslips` (
  `PayslipId` INT NOT NULL AUTO_INCREMENT,
  `UserId` INT NOT NULL,
  `Month` LONGTEXT NOT NULL,
  `Year` INT NOT NULL,
  `PayslipPath` LONGTEXT NOT NULL,
  `GeneratedOn` DATETIME NOT NULL,
  PRIMARY KEY (`PayslipId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `PerformanceAppriasal` (
  `PerformanceAppriasalId` INT NOT NULL AUTO_INCREMENT,
  `AppraisalDate` DATETIME NOT NULL,
  `Status` LONGTEXT NOT NULL,
  `CustomerExperience` LONGTEXT NOT NULL,
  `Marketing` LONGTEXT NOT NULL,
  `Management` LONGTEXT NOT NULL,
  `Administration` LONGTEXT NOT NULL,
  `PresentationSkills` LONGTEXT NOT NULL,
  `QualityofWork` LONGTEXT NOT NULL,
  `Efficiency` LONGTEXT NOT NULL,
  `Integrity` LONGTEXT NOT NULL,
  `Professionalism` LONGTEXT NOT NULL,
  `TeamWork` LONGTEXT NOT NULL,
  `CriticalThinking` LONGTEXT NOT NULL,
  `ConflictManagement` LONGTEXT NOT NULL,
  `Attendance` LONGTEXT NOT NULL,
  `AbilityToMeetDeadline` LONGTEXT NOT NULL,
  `UserId` INT NOT NULL,
  `DepartmentId` INT NULL,
  `DesignationId` INT NOT NULL,
  PRIMARY KEY (`PerformanceAppriasalId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `PerformanceIndicators` (
  `PerformanceIndicatorId` INT NOT NULL AUTO_INCREMENT,
  `ApprovedBy` LONGTEXT NOT NULL,
  `CreatedAt` DATETIME NOT NULL,
  `Status` LONGTEXT NOT NULL,
  `CustomerExperience` LONGTEXT NOT NULL,
  `Marketing` LONGTEXT NOT NULL,
  `Management` LONGTEXT NOT NULL,
  `Administration` LONGTEXT NOT NULL,
  `PresentationSkills` LONGTEXT NOT NULL,
  `QualityofWork` LONGTEXT NOT NULL,
  `Efficiency` LONGTEXT NOT NULL,
  `Integrity` LONGTEXT NOT NULL,
  `Professionalism` LONGTEXT NOT NULL,
  `TeamWork` LONGTEXT NOT NULL,
  `CriticalThinking` LONGTEXT NOT NULL,
  `ConflictManagement` LONGTEXT NOT NULL,
  `Attendance` LONGTEXT NOT NULL,
  `AbilityToMeetDeadline` LONGTEXT NOT NULL,
  `DepartmentId` INT NULL,
  `DesignationId` INT NOT NULL,
  PRIMARY KEY (`PerformanceIndicatorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `PerformanceReviews` (
  `ReviewId` INT NOT NULL AUTO_INCREMENT,
  `Name` LONGTEXT NOT NULL,
  `Department` LONGTEXT NOT NULL,
  `EmployeeId` INT NOT NULL,
  `Designation` LONGTEXT NOT NULL,
  `DateofJoin` DATETIME NOT NULL,
  `ROName` LONGTEXT NOT NULL,
  `DateofConfirmation` DATETIME NOT NULL,
  `RODesignation` LONGTEXT NOT NULL,
  `Qualification` LONGTEXT NOT NULL,
  `PreviousyearsofExp` INT NOT NULL,
  PRIMARY KEY (`ReviewId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ProjectsUser` (
  `ProjectsProjectId` INT NOT NULL,
  `UsersUserId` INT NOT NULL,
  PRIMARY KEY (`ProjectsProjectId`, `UsersUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Promotion` (
  `PromotionId` INT NOT NULL AUTO_INCREMENT,
  `UserID` INT NOT NULL,
  `DesignationFrom` VARCHAR(100) NOT NULL,
  `DesignationTo` VARCHAR(100) NOT NULL,
  `Date` DATETIME NOT NULL,
  PRIMARY KEY (`PromotionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Resignation` (
  `ResignationId` INT NOT NULL AUTO_INCREMENT,
  `UserID` INT NOT NULL,
  `DepartmentId` INT NOT NULL,
  `NoticeDate` DATETIME NOT NULL,
  `ResignDate` DATETIME NOT NULL,
  `Reason` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`ResignationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Role` (
  `RoleId` INT NOT NULL AUTO_INCREMENT,
  `RoleName` LONGTEXT NOT NULL,
  `Status` LONGTEXT NOT NULL,
  `CreatedAt` DATETIME NULL,
  `CreatedBy` VARCHAR(255) NULL,
  `ModifiedBy` VARCHAR(255) NULL,
  `ModifiedAt` DATETIME NULL,
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `subTopics` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Title` LONGTEXT NOT NULL,
  `KnowledgeBaseTopicId` INT NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Task` (
  `TaskId` INT NOT NULL AUTO_INCREMENT,
  `ProjectId` INT NOT NULL,
  `Title` VARCHAR(255) NOT NULL,
  `Description` VARCHAR(1000) NOT NULL,
  `Status` VARCHAR(50) NOT NULL,
  `Priority` VARCHAR(50) NOT NULL,
  `FilePath` VARCHAR(255) NULL,
  `Deadline` DATETIME NOT NULL,
  PRIMARY KEY (`TaskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `TaskBoards` (
  `TaskBoardId` INT NOT NULL AUTO_INCREMENT,
  `ProjectId` INT NOT NULL,
  `TaskId` INT NOT NULL,
  `Percentage` INT NOT NULL,
  `DueDate` DATETIME NOT NULL,
  `TasksTaskId` INT NULL,
  PRIMARY KEY (`TaskBoardId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Taskmember` (
  `AssignedId` INT NOT NULL AUTO_INCREMENT,
  `TaskId` INT NOT NULL,
  `UserId` INT NOT NULL,
  PRIMARY KEY (`AssignedId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Termination` (
  `TerminationId` INT NOT NULL AUTO_INCREMENT,
  `UserID` INT NOT NULL,
  `TerminationType` VARCHAR(100) NOT NULL,
  `NoticeDate` DATETIME NOT NULL,
  `ResignDate` DATETIME NOT NULL,
  `Reason` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`TerminationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `TicketReplies` (
  `ReplyId` INT NOT NULL AUTO_INCREMENT,
  `TicketId` INT NOT NULL,
  `ReplyMessage` VARCHAR(500) NOT NULL,
  `RepliedBy` VARCHAR(100) NOT NULL,
  `RepliedAt` DATETIME NOT NULL,
  PRIMARY KEY (`ReplyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Tickets` (
  `TicketId` INT NOT NULL AUTO_INCREMENT,
  `TicketTitle` VARCHAR(200) NOT NULL,
  `EventCategory` LONGTEXT NOT NULL,
  `Subject` VARCHAR(200) NOT NULL,
  `AssignedBy` INT NOT NULL,
  `AssignedTo` INT NOT NULL,
  `TicketDescription` LONGTEXT NOT NULL,
  `Priority` VARCHAR(50) NOT NULL,
  `Status` VARCHAR(50) NOT NULL,
  `Visibility` VARCHAR(10) NOT NULL,
  `CreatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`TicketId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Timesheets` (
  `TimesheetId` INT NOT NULL AUTO_INCREMENT,
  `UserId` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  `WorkHours` INT NOT NULL,
  `Status` LONGTEXT NOT NULL,
  `CreatedBy` LONGTEXT NOT NULL,
  `CreatedAt` DATETIME NOT NULL,
  `ApprovedBy` LONGTEXT NULL,
  `ApprovedAt` DATETIME NULL,
  `ProjectId` INT NOT NULL,
  PRIMARY KEY (`TimesheetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Trainer` (
  `TrainerId` INT NOT NULL AUTO_INCREMENT,
  `FirstName` LONGTEXT NOT NULL,
  `LastName` LONGTEXT NOT NULL,
  `Role` LONGTEXT NOT NULL,
  `Email` LONGTEXT NOT NULL,
  `Description` LONGTEXT NOT NULL,
  `Status` LONGTEXT NOT NULL,
  `Phone` BIGINT NOT NULL,
  `ProfilePicture` LONGTEXT NULL,
  PRIMARY KEY (`TrainerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Training` (
  `TrainingId` INT NOT NULL AUTO_INCREMENT,
  `TrainerId` INT NOT NULL,
  `TrainingTypeId` INT NOT NULL,
  `UserId` INT NOT NULL,
  `TrainingCost` DECIMAL(18, 2) NOT NULL,
  `Description` LONGTEXT NOT NULL,
  `Status` LONGTEXT NOT NULL,
  `StartDate` DATETIME NOT NULL,
  `EndDate` DATETIME NOT NULL,
  `CreatedAt` DATETIME NULL,
  `CreatedBy` VARCHAR(255) NULL,
  `ModifiedBy` VARCHAR(255) NULL,
  `ModifiedAt` DATETIME NULL,
  PRIMARY KEY (`TrainingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `TrainingType` (
  `TrainingTypeId` INT NOT NULL AUTO_INCREMENT,
  `TrainingTypeName` LONGTEXT NOT NULL,
  `Description` LONGTEXT NOT NULL,
  `Status` LONGTEXT NOT NULL,
  PRIMARY KEY (`TrainingTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `User` (
  `UserId` INT NOT NULL AUTO_INCREMENT,
  `FirstName` LONGTEXT NOT NULL,
  `LastName` LONGTEXT NOT NULL,
  `Email` LONGTEXT NOT NULL,
  `PasswordHash` LONGTEXT NOT NULL,
  `PhoneNumber` LONGTEXT NOT NULL,
  `RoleId` INT NOT NULL,
  `DepartmentId` INT NULL,
  `DesignationtId` INT NULL,
  `DateOfJoining` DATETIME NOT NULL,
  `DateOfBirth` DATETIME NOT NULL,
  `Gender` LONGTEXT NOT NULL,
  `Address` LONGTEXT NOT NULL,
  `AboutEmployee` LONGTEXT NOT NULL,
  `ProfilePicture` LONGTEXT NOT NULL,
  `RoleId1` INT NULL,
  `ReportingManager` LONGTEXT NULL,
  `CreatedAt` DATETIME NULL,
  `CreatedBy` VARCHAR(255) NULL,
  `ModifiedBy` VARCHAR(255) NULL,
  `ModifiedAt` DATETIME NULL,
  `Status` VARCHAR(100) NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- DATA
INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES ('20250130171516_employyee', '7.0.0');
INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES ('20250201062511_training', '7.0.0');
INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES ('20250201063016_trainings', '7.0.0');
INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES ('20250201083737_finaldbpulse360', '7.0.0');
INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES ('20250201164635_task', '7.0.0');
INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES ('20250201191513_employeemodel', '7.0.0');
INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES ('20250201220629_Payslips', '7.0.0');
INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES ('20250202081135_earning', '7.0.0');
INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES ('20250202082634_earning2', '7.0.0');
INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES ('20250202090251_earningfk', '7.0.0');
INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES ('20250202114652_payslipdeduction', '7.0.0');
INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES ('20250202122512_payslipdearning', '7.0.0');
INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES ('20250203074906_Employee', '7.0.0');
INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES ('20250204170727_Payslip', '7.0.0');
INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES ('20250205075751_chat', '7.0.0');
INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES ('20250205212616_Projecttask', '7.0.0');
INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES ('20250205215207_aaplicationdbTaskboards', '7.0.0');
INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES ('20250206114351_eventstatus', '7.0.0');
INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES ('20250207082704_event', '7.0.0');
INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES ('20250207121601_final1', '7.0.0');
INSERT INTO `Activity` (`ActivityId`, `Title`, `ActivityType`, `DueDate`, `Owner`, `CreatedDate`, `Description`, `Status`) VALUES (1, 'Meeting', 'meetinggg', '2025-02-05T00:00:00.0000000', 'Admin', '0001-01-01T00:00:00.0000000', 'dadsasa', 'ongoing');
INSERT INTO `addAdminDocNames` (`Id`, `DocName`) VALUES (5, 'Appointment Letter');
INSERT INTO `addAdminDocNames` (`Id`, `DocName`) VALUES (6, 'Confirmation Letter');
INSERT INTO `addAdminDocNames` (`Id`, `DocName`) VALUES (7, 'ITR');
INSERT INTO `addAdminDocNames` (`Id`, `DocName`) VALUES (8, 'Form 16');
INSERT INTO `addAdminDocNames` (`Id`, `DocName`) VALUES (9, 'Appraisal Letter');
INSERT INTO `addEmployeeDocNames` (`Id`, `DocName`) VALUES (2, 'HSC Marksheet');
INSERT INTO `addEmployeeDocNames` (`Id`, `DocName`) VALUES (3, 'PAN Card');
INSERT INTO `AdminDocuments` (`AdminDocId`, `Email`, `DocName`, `DocFile`) VALUES (1, 'yashghole12@gmail.com', 'Offer-letter', 'Offer-letter6742785.pdf');
INSERT INTO `AllProjects` (`ProjectId`, `ProjectName`, `ClientName`, `Description`, `StartDate`, `EndDate`, `Priority`, `ProjectValue`, `PriceType`, `FilePath`, `LogoPath`, `Status`, `ManagerName`) VALUES (15, 'Hospital', 'Vedant', 'Nill', '2025-02-26T00:00:00.0000000', '2025-02-20T00:00:00.0000000', 'High', 100, '$', 'uploads/files/140680be-f952-4785-838f-24b613eb47e6.xlsx', 'uploads/logos/42f1773f-dd1e-4869-a2e8-1a503c6c2d14.png', 'Active', 'Krish');
INSERT INTO `AllProjects` (`ProjectId`, `ProjectName`, `ClientName`, `Description`, `StartDate`, `EndDate`, `Priority`, `ProjectValue`, `PriceType`, `FilePath`, `LogoPath`, `Status`, `ManagerName`) VALUES (16, 'Restaurant', 'Client1', 'None', '2025-02-06T00:00:00.0000000', '2025-02-27T00:00:00.0000000', 'Medium', 0, '$', 'uploads/files/13f5a208-e77a-425d-b7ba-51beebd35ecb.xlsx', 'uploads/logos/bcfc3ff7-341a-41a2-a066-d5ff09921ac4.jpg', 'Active', 'Krish');
INSERT INTO `AllProjects` (`ProjectId`, `ProjectName`, `ClientName`, `Description`, `StartDate`, `EndDate`, `Priority`, `ProjectValue`, `PriceType`, `FilePath`, `LogoPath`, `Status`, `ManagerName`) VALUES (18, 'Estate', 'XYZ', 'Nill', '2025-03-07T00:00:00.0000000', '2025-03-13T00:00:00.0000000', 'High', 0, '$', 'wwwroot/uploads/files/6cb3006f-c8a2-4d4e-b53d-622e4b82003b.xlsx', 'wwwroot/uploads/logos/0a25b000-1f1a-429c-b12d-1637ccaf9316.png', 'Inactive', 'Krish');
INSERT INTO `AllProjects` (`ProjectId`, `ProjectName`, `ClientName`, `Description`, `StartDate`, `EndDate`, `Priority`, `ProjectValue`, `PriceType`, `FilePath`, `LogoPath`, `Status`, `ManagerName`) VALUES (19, 'EduWave', 'Masstech', 'Nill', '2025-03-06T00:00:00.0000000', '2025-03-20T00:00:00.0000000', 'High', 100, 'INR', 'uploads/files/bb5eccbe-777d-4886-9fcd-beb98ff047f7.pdf', 'uploads/logos/01cd23ee-a07a-4824-82c6-6533c35081f1.png', 'Active', 'Krish');
INSERT INTO `AllProjects` (`ProjectId`, `ProjectName`, `ClientName`, `Description`, `StartDate`, `EndDate`, `Priority`, `ProjectValue`, `PriceType`, `FilePath`, `LogoPath`, `Status`, `ManagerName`) VALUES (20, 'HRMS Project', 'Masstech', 'None', '2026-08-25T00:00:00.0000000', '2026-08-29T00:00:00.0000000', 'High', 1000, 'USD', 'uploads/files/b3a91f39-349a-426e-9828-e300131e19ca.jpg', 'uploads/logos/6024b409-6983-4521-904e-ebfe508cd994.jpg', 'Active', 'Krish');
INSERT INTO `AllProjects` (`ProjectId`, `ProjectName`, `ClientName`, `Description`, `StartDate`, `EndDate`, `Priority`, `ProjectValue`, `PriceType`, `FilePath`, `LogoPath`, `Status`, `ManagerName`) VALUES (21, 'HRMS', 'Masstech', 'None', '2026-09-07T00:00:00.0000000', '2026-09-11T00:00:00.0000000', 'High', 10000, 'USD', 'uploads/files/e2ff95be-cca0-4716-9557-cef61bb57253.jpg', 'uploads/logos/1dd044fd-3d35-415c-9b2b-d3150e409966.jpg', 'Active', 'Krish');
INSERT INTO `Attendance` (`AttendanceId`, `UserId`, `Date`, `CheckIn`, `CheckOut`, `LunchIn`, `LunchOut`, `WorkingHours`, `ProductionHours`, `OvertimeHours`, `BreakHours`, `Late`, `Status`) VALUES (28, 37, '2025-03-01T00:00:00.0000000', NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 'Absent');
INSERT INTO `Attendance` (`AttendanceId`, `UserId`, `Date`, `CheckIn`, `CheckOut`, `LunchIn`, `LunchOut`, `WorkingHours`, `ProductionHours`, `OvertimeHours`, `BreakHours`, `Late`, `Status`) VALUES (29, 42, '2025-03-02T00:00:00.0000000', '2025-03-02T17:39:35.8621351', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 'Present');
INSERT INTO `Attendance` (`AttendanceId`, `UserId`, `Date`, `CheckIn`, `CheckOut`, `LunchIn`, `LunchOut`, `WorkingHours`, `ProductionHours`, `OvertimeHours`, `BreakHours`, `Late`, `Status`) VALUES (30, 42, '2026-08-24T00:00:00.0000000', '2026-08-24T14:18:26.8421903', NULL, '2026-08-24T14:19:21.7616458', NULL, 0.00, 0.00, 0.00, 0.00, 0, 'Present');
INSERT INTO `Attendance` (`AttendanceId`, `UserId`, `Date`, `CheckIn`, `CheckOut`, `LunchIn`, `LunchOut`, `WorkingHours`, `ProductionHours`, `OvertimeHours`, `BreakHours`, `Late`, `Status`) VALUES (31, 37, '2026-09-05T00:00:00.0000000', '2026-09-05T10:10:53.6553837', '2026-09-05T10:12:23.5833485', '2026-09-05T10:11:09.1497355', '2026-09-05T10:11:15.2535366', 0.02, 0.00, 0.00, 0.00, 90, 'Half Day');
INSERT INTO `Attendance` (`AttendanceId`, `UserId`, `Date`, `CheckIn`, `CheckOut`, `LunchIn`, `LunchOut`, `WorkingHours`, `ProductionHours`, `OvertimeHours`, `BreakHours`, `Late`, `Status`) VALUES (32, 42, '2026-09-05T00:00:00.0000000', '2026-09-05T15:22:24.4679946', '2026-09-05T15:24:25.2254540', '2026-09-05T15:22:34.3568576', '2026-09-05T15:22:38.8153281', 0.03, 0.00, 0.00, 0.00, 390, 'Half Day');
INSERT INTO `Attendance` (`AttendanceId`, `UserId`, `Date`, `CheckIn`, `CheckOut`, `LunchIn`, `LunchOut`, `WorkingHours`, `ProductionHours`, `OvertimeHours`, `BreakHours`, `Late`, `Status`) VALUES (33, 37, '2025-01-05T00:00:00.0000000', '2025-01-05T09:05:00.0000000', '2025-01-05T18:10:00.0000000', '2025-01-05T13:00:00.0000000', '2025-01-05T13:30:00.0000000', 8.50, 8.00, 0.50, 0.50, 5, 'Present');
INSERT INTO `Attendance` (`AttendanceId`, `UserId`, `Date`, `CheckIn`, `CheckOut`, `LunchIn`, `LunchOut`, `WorkingHours`, `ProductionHours`, `OvertimeHours`, `BreakHours`, `Late`, `Status`) VALUES (34, 42, '2025-01-05T00:00:00.0000000', '2025-01-05T09:15:00.0000000', '2025-01-05T18:00:00.0000000', '2025-01-05T13:00:00.0000000', '2025-01-05T13:30:00.0000000', 8.20, 7.80, 0.00, 0.50, 15, 'Present');
INSERT INTO `Attendance` (`AttendanceId`, `UserId`, `Date`, `CheckIn`, `CheckOut`, `LunchIn`, `LunchOut`, `WorkingHours`, `ProductionHours`, `OvertimeHours`, `BreakHours`, `Late`, `Status`) VALUES (35, 37, '2025-02-05T00:00:00.0000000', NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 'Absent');
INSERT INTO `Attendance` (`AttendanceId`, `UserId`, `Date`, `CheckIn`, `CheckOut`, `LunchIn`, `LunchOut`, `WorkingHours`, `ProductionHours`, `OvertimeHours`, `BreakHours`, `Late`, `Status`) VALUES (36, 42, '2025-02-05T00:00:00.0000000', '2025-02-05T09:00:00.0000000', '2025-02-05T18:00:00.0000000', '2025-02-05T13:00:00.0000000', '2025-02-05T13:30:00.0000000', 8.50, 8.10, 0.00, 0.50, 0, 'Present');
INSERT INTO `Attendance` (`AttendanceId`, `UserId`, `Date`, `CheckIn`, `CheckOut`, `LunchIn`, `LunchOut`, `WorkingHours`, `ProductionHours`, `OvertimeHours`, `BreakHours`, `Late`, `Status`) VALUES (37, 37, '2025-03-05T00:00:00.0000000', '2025-03-05T09:00:00.0000000', '2025-03-05T18:00:00.0000000', '2025-03-05T13:00:00.0000000', '2025-03-05T13:30:00.0000000', 8.50, 8.20, 0.00, 0.50, 0, 'Present');
INSERT INTO `Attendance` (`AttendanceId`, `UserId`, `Date`, `CheckIn`, `CheckOut`, `LunchIn`, `LunchOut`, `WorkingHours`, `ProductionHours`, `OvertimeHours`, `BreakHours`, `Late`, `Status`) VALUES (38, 42, '2025-03-05T00:00:00.0000000', '2025-03-05T09:00:00.0000000', '2025-03-05T18:00:00.0000000', '2025-03-05T13:00:00.0000000', '2025-03-05T13:30:00.0000000', 8.50, 8.20, 0.00, 0.50, 0, 'Present');
INSERT INTO `Attendance` (`AttendanceId`, `UserId`, `Date`, `CheckIn`, `CheckOut`, `LunchIn`, `LunchOut`, `WorkingHours`, `ProductionHours`, `OvertimeHours`, `BreakHours`, `Late`, `Status`) VALUES (39, 37, '2025-04-05T00:00:00.0000000', '2025-04-05T09:10:00.0000000', '2025-04-05T18:05:00.0000000', '2025-04-05T13:00:00.0000000', '2025-04-05T13:30:00.0000000', 8.30, 7.90, 0.00, 0.50, 10, 'Present');
INSERT INTO `Attendance` (`AttendanceId`, `UserId`, `Date`, `CheckIn`, `CheckOut`, `LunchIn`, `LunchOut`, `WorkingHours`, `ProductionHours`, `OvertimeHours`, `BreakHours`, `Late`, `Status`) VALUES (40, 42, '2025-04-05T00:00:00.0000000', NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 'Absent');
INSERT INTO `Attendance` (`AttendanceId`, `UserId`, `Date`, `CheckIn`, `CheckOut`, `LunchIn`, `LunchOut`, `WorkingHours`, `ProductionHours`, `OvertimeHours`, `BreakHours`, `Late`, `Status`) VALUES (41, 37, '2025-05-05T00:00:00.0000000', '2025-05-05T09:00:00.0000000', '2025-05-05T17:50:00.0000000', '2025-05-05T13:00:00.0000000', '2025-05-05T13:30:00.0000000', 8.20, 7.80, 0.00, 0.50, 0, 'Present');
INSERT INTO `Attendance` (`AttendanceId`, `UserId`, `Date`, `CheckIn`, `CheckOut`, `LunchIn`, `LunchOut`, `WorkingHours`, `ProductionHours`, `OvertimeHours`, `BreakHours`, `Late`, `Status`) VALUES (42, 42, '2025-05-05T00:00:00.0000000', '2025-05-05T09:05:00.0000000', '2025-05-05T18:00:00.0000000', '2025-05-05T13:00:00.0000000', '2025-05-05T13:30:00.0000000', 8.30, 7.90, 0.00, 0.50, 5, 'Present');
INSERT INTO `Attendance` (`AttendanceId`, `UserId`, `Date`, `CheckIn`, `CheckOut`, `LunchIn`, `LunchOut`, `WorkingHours`, `ProductionHours`, `OvertimeHours`, `BreakHours`, `Late`, `Status`) VALUES (43, 37, '2025-06-05T00:00:00.0000000', '2025-06-05T09:00:00.0000000', '2025-06-05T13:00:00.0000000', NULL, NULL, 4.00, 3.80, 0.00, 0.00, 0, 'Half Day');
INSERT INTO `Attendance` (`AttendanceId`, `UserId`, `Date`, `CheckIn`, `CheckOut`, `LunchIn`, `LunchOut`, `WorkingHours`, `ProductionHours`, `OvertimeHours`, `BreakHours`, `Late`, `Status`) VALUES (44, 42, '2025-06-05T00:00:00.0000000', '2025-06-05T09:00:00.0000000', '2025-06-05T18:15:00.0000000', '2025-06-05T13:00:00.0000000', '2025-06-05T13:30:00.0000000', 8.60, 8.30, 0.20, 0.50, 0, 'Present');
INSERT INTO `Attendance` (`AttendanceId`, `UserId`, `Date`, `CheckIn`, `CheckOut`, `LunchIn`, `LunchOut`, `WorkingHours`, `ProductionHours`, `OvertimeHours`, `BreakHours`, `Late`, `Status`) VALUES (45, 37, '2025-07-05T00:00:00.0000000', '2025-07-05T09:00:00.0000000', '2025-07-05T18:20:00.0000000', '2025-07-05T13:00:00.0000000', '2025-07-05T13:30:00.0000000', 8.70, 8.40, 0.30, 0.50, 0, 'Present');
INSERT INTO `Attendance` (`AttendanceId`, `UserId`, `Date`, `CheckIn`, `CheckOut`, `LunchIn`, `LunchOut`, `WorkingHours`, `ProductionHours`, `OvertimeHours`, `BreakHours`, `Late`, `Status`) VALUES (46, 42, '2025-07-05T00:00:00.0000000', '2025-07-05T09:00:00.0000000', '2025-07-05T13:10:00.0000000', NULL, NULL, 4.20, 4.00, 0.00, 0.00, 0, 'Half Day');
INSERT INTO `Attendance` (`AttendanceId`, `UserId`, `Date`, `CheckIn`, `CheckOut`, `LunchIn`, `LunchOut`, `WorkingHours`, `ProductionHours`, `OvertimeHours`, `BreakHours`, `Late`, `Status`) VALUES (47, 37, '2025-08-05T00:00:00.0000000', '2025-08-05T09:05:00.0000000', '2025-08-05T18:00:00.0000000', '2025-08-05T13:00:00.0000000', '2025-08-05T13:30:00.0000000', 8.40, 8.00, 0.00, 0.50, 5, 'Present');
INSERT INTO `Attendance` (`AttendanceId`, `UserId`, `Date`, `CheckIn`, `CheckOut`, `LunchIn`, `LunchOut`, `WorkingHours`, `ProductionHours`, `OvertimeHours`, `BreakHours`, `Late`, `Status`) VALUES (48, 42, '2025-08-05T00:00:00.0000000', '2025-08-05T09:00:00.0000000', '2025-08-05T17:55:00.0000000', '2025-08-05T13:00:00.0000000', '2025-08-05T13:30:00.0000000', 8.40, 8.00, 0.00, 0.50, 0, 'Present');
INSERT INTO `Attendance` (`AttendanceId`, `UserId`, `Date`, `CheckIn`, `CheckOut`, `LunchIn`, `LunchOut`, `WorkingHours`, `ProductionHours`, `OvertimeHours`, `BreakHours`, `Late`, `Status`) VALUES (49, 37, '2025-09-05T00:00:00.0000000', '2025-09-05T09:00:00.0000000', '2025-09-05T18:00:00.0000000', '2025-09-05T13:00:00.0000000', '2025-09-05T13:30:00.0000000', 8.50, 8.20, 0.00, 0.50, 0, 'Present');
INSERT INTO `Attendance` (`AttendanceId`, `UserId`, `Date`, `CheckIn`, `CheckOut`, `LunchIn`, `LunchOut`, `WorkingHours`, `ProductionHours`, `OvertimeHours`, `BreakHours`, `Late`, `Status`) VALUES (50, 42, '2025-09-05T00:00:00.0000000', '2025-09-05T09:00:00.0000000', '2025-09-05T18:30:00.0000000', '2025-09-05T13:00:00.0000000', '2025-09-05T13:30:00.0000000', 8.60, 8.30, 0.30, 0.50, 0, 'Present');
INSERT INTO `Categories` (`CategoryId`, `CategoryName`) VALUES (3, 'Test');
INSERT INTO `Deduction` (`DeductionId`, `DeductionTypeId`, `DepartmentId`, `DesignationId`, `DeductionPercentage`, `CreatedAt`, `CreatedBy`, `ModifiedAt`, `ModifiedBy`) VALUES (3, 1, 25, 12, 10.00, '2025-02-26T14:48:47.4190908', 'admin@gmail.com', NULL, NULL);
INSERT INTO `Deduction` (`DeductionId`, `DeductionTypeId`, `DepartmentId`, `DesignationId`, `DeductionPercentage`, `CreatedAt`, `CreatedBy`, `ModifiedAt`, `ModifiedBy`) VALUES (4, 3, 25, 12, 20.00, '2026-08-24T09:28:51.7702064', 'admin@gmail.com', NULL, NULL);
INSERT INTO `DeductionType` (`DeductionTypeId`, `DeductionsName`) VALUES (1, 'Tax');
INSERT INTO `DeductionType` (`DeductionTypeId`, `DeductionsName`) VALUES (3, 'PF');
INSERT INTO `DepartmentLeaves` (`DepartmentLeavesId`, `DepartmentId`, `LeaveTypeId`, `LeavesCount`, `Status`) VALUES (7, 25, 4, 5, 'Active');
INSERT INTO `DepartmentLeaves` (`DepartmentLeavesId`, `DepartmentId`, `LeaveTypeId`, `LeavesCount`, `Status`) VALUES (8, 25, 5, 4, 'Inactive');
INSERT INTO `DepartmentLeaves` (`DepartmentLeavesId`, `DepartmentId`, `LeaveTypeId`, `LeavesCount`, `Status`) VALUES (9, 25, 7, 0, 'Inactive');
INSERT INTO `DepartmentLeaves` (`DepartmentLeavesId`, `DepartmentId`, `LeaveTypeId`, `LeavesCount`, `Status`) VALUES (10, 26, 7, 0, 'Inactive');
INSERT INTO `DepartmentLeaves` (`DepartmentLeavesId`, `DepartmentId`, `LeaveTypeId`, `LeavesCount`, `Status`) VALUES (11, 27, 7, 0, 'Inactive');
INSERT INTO `DepartmentLeaves` (`DepartmentLeavesId`, `DepartmentId`, `LeaveTypeId`, `LeavesCount`, `Status`) VALUES (12, 28, 7, 0, 'Inactive');
INSERT INTO `DepartmentLeaves` (`DepartmentLeavesId`, `DepartmentId`, `LeaveTypeId`, `LeavesCount`, `Status`) VALUES (13, 29, 7, 0, 'Inactive');
INSERT INTO `DepartmentLeaves` (`DepartmentLeavesId`, `DepartmentId`, `LeaveTypeId`, `LeavesCount`, `Status`) VALUES (14, 25, 8, 10, 'Inactive');
INSERT INTO `DepartmentLeaves` (`DepartmentLeavesId`, `DepartmentId`, `LeaveTypeId`, `LeavesCount`, `Status`) VALUES (15, 25, 9, 6, 'Active');
INSERT INTO `Departments` (`DepartmentId`, `Name`, `NoOfEmployee`, `Status`, `CreatedAt`, `CreatedBy`, `ModifiedBy`, `ModifiedAt`) VALUES (25, 'IT', NULL, 'Active', NULL, NULL, NULL, NULL);
INSERT INTO `Departments` (`DepartmentId`, `Name`, `NoOfEmployee`, `Status`, `CreatedAt`, `CreatedBy`, `ModifiedBy`, `ModifiedAt`) VALUES (26, 'HR', NULL, 'Inactive', '2025-02-18T16:46:33.843', 'admin', 'admin', '2025-02-23T15:36:53.497');
INSERT INTO `Departments` (`DepartmentId`, `Name`, `NoOfEmployee`, `Status`, `CreatedAt`, `CreatedBy`, `ModifiedBy`, `ModifiedAt`) VALUES (27, 'Test1', NULL, 'Active', '2025-03-01T12:45:14.900', 'admin', NULL, NULL);
INSERT INTO `Departments` (`DepartmentId`, `Name`, `NoOfEmployee`, `Status`, `CreatedAt`, `CreatedBy`, `ModifiedBy`, `ModifiedAt`) VALUES (28, 'Test2', NULL, 'Active', '2025-03-01T12:45:27.520', 'admin', NULL, NULL);
INSERT INTO `Departments` (`DepartmentId`, `Name`, `NoOfEmployee`, `Status`, `CreatedAt`, `CreatedBy`, `ModifiedBy`, `ModifiedAt`) VALUES (29, 'Test3', NULL, 'Inactive', '2025-03-01T12:45:49.473', 'admin', 'admin', '2025-03-05T07:48:02.543');
INSERT INTO `Designations` (`DesignationId`, `DepartmentId`, `Name`, `NoOfEmployee`, `status`, `CreatedAt`, `CreatedBy`, `ModifiedBy`, `ModifiedAt`) VALUES (12, 25, 'Software Developer', NULL, 'Active', NULL, NULL, NULL, NULL);
INSERT INTO `Designations` (`DesignationId`, `DepartmentId`, `Name`, `NoOfEmployee`, `status`, `CreatedAt`, `CreatedBy`, `ModifiedBy`, `ModifiedAt`) VALUES (15, 25, 'Sales', NULL, 'Active', '2025-02-22T05:55:21.707', 'admin', 'admin', '2025-03-02T09:39:54.153');
INSERT INTO `Designations` (`DesignationId`, `DepartmentId`, `Name`, `NoOfEmployee`, `status`, `CreatedAt`, `CreatedBy`, `ModifiedBy`, `ModifiedAt`) VALUES (16, 27, 'Test1', NULL, 'Inactive', '2025-03-01T12:51:28.350', 'admin', 'admin', '2025-03-04T10:29:01.950');
INSERT INTO `Earning` (`EarningsId`, `EarntypeId`, `EarningsPercentage`, `DepartmentId`, `DesignationId`, `CreatedBy`, `CreatedAt`, `ModifiedBy`, `ModifiedAt`) VALUES (1007, 2, 5.00, 25, 12, 'admin@gmail.com', '2025-02-26T14:48:12.8488485', NULL, NULL);
INSERT INTO `Earning` (`EarningsId`, `EarntypeId`, `EarningsPercentage`, `DepartmentId`, `DesignationId`, `CreatedBy`, `CreatedAt`, `ModifiedBy`, `ModifiedAt`) VALUES (1008, 12, 5.00, 25, 12, 'admin@gmail.com', '2026-08-24T09:28:16.3874722', NULL, NULL);
INSERT INTO `Earning` (`EarningsId`, `EarntypeId`, `EarningsPercentage`, `DepartmentId`, `DesignationId`, `CreatedBy`, `CreatedAt`, `ModifiedBy`, `ModifiedAt`) VALUES (1009, 3, 5.00, 25, 12, 'admin@gmail.com', '2026-09-05T05:05:16.5058302', NULL, NULL);
INSERT INTO `EarningType` (`EarntypeId`, `EarningName`) VALUES (1, 'Basic Salary');
INSERT INTO `EarningType` (`EarntypeId`, `EarningName`) VALUES (2, 'Bonus');
INSERT INTO `EarningType` (`EarntypeId`, `EarningName`) VALUES (3, 'Commission');
INSERT INTO `EarningType` (`EarntypeId`, `EarningName`) VALUES (4, 'Overtime Pay');
INSERT INTO `EarningType` (`EarntypeId`, `EarningName`) VALUES (5, 'Holiday Pay');
INSERT INTO `EarningType` (`EarntypeId`, `EarningName`) VALUES (6, 'Allowances');
INSERT INTO `EarningType` (`EarntypeId`, `EarningName`) VALUES (7, 'Incentive');
INSERT INTO `EarningType` (`EarntypeId`, `EarningName`) VALUES (8, 'Gratuity');
INSERT INTO `EarningType` (`EarntypeId`, `EarningName`) VALUES (9, 'Profit Sharing');
INSERT INTO `EarningType` (`EarntypeId`, `EarningName`) VALUES (10, 'Other');
INSERT INTO `EarningType` (`EarntypeId`, `EarningName`) VALUES (11, 'Bonus');
INSERT INTO `EarningType` (`EarntypeId`, `EarningName`) VALUES (12, 'Gratuity');
INSERT INTO `EducationDetails` (`EducationDetailsId`, `EducationType`, `UniversityName`, `UserId`, `startdate`, `enddate`) VALUES (1, 'IT', 'Bhavans College', 1, '2025-10-02T00:00:00.000', '2025-10-02T00:00:00.000');
INSERT INTO `EmployeeBankDetails` (`BankDetailId`, `BankName`, `AccountNumber`, `IFSCCode`, `BranchName`, `UserId`) VALUES (1, 'Bank of Baroda', '25364719182', '2346573', 'Mumbai', 1);
INSERT INTO `EmployeeDeductions` (`EmployeeDeductionId`, `SalaryId`, `UserId`, `DeductionId`, `DeductionAmount`) VALUES (1007, 1006, 38, 3, 500.00);
INSERT INTO `EmployeeDeductions` (`EmployeeDeductionId`, `SalaryId`, `UserId`, `DeductionId`, `DeductionAmount`) VALUES (1008, 1007, 35, 3, 500.00);
INSERT INTO `EmployeeDeductions` (`EmployeeDeductionId`, `SalaryId`, `UserId`, `DeductionId`, `DeductionAmount`) VALUES (1010, 1009, 40, 3, 5000.00);
INSERT INTO `EmployeeDeductions` (`EmployeeDeductionId`, `SalaryId`, `UserId`, `DeductionId`, `DeductionAmount`) VALUES (1011, 1010, 37, 3, 2000.00);
INSERT INTO `EmployeeDeductions` (`EmployeeDeductionId`, `SalaryId`, `UserId`, `DeductionId`, `DeductionAmount`) VALUES (1012, 1010, 37, 4, 4000.00);
INSERT INTO `EmployeeDeductions` (`EmployeeDeductionId`, `SalaryId`, `UserId`, `DeductionId`, `DeductionAmount`) VALUES (1013, 1011, 42, 3, 5000.00);
INSERT INTO `EmployeeDeductions` (`EmployeeDeductionId`, `SalaryId`, `UserId`, `DeductionId`, `DeductionAmount`) VALUES (1014, 1011, 42, 4, 10000.00);
INSERT INTO `EmployeeEarnings` (`EmployeeEarningId`, `SalaryId`, `UserId`, `EarningId`, `EarningAmount`) VALUES (1017, 1006, 38, 1007, 250.00);
INSERT INTO `EmployeeEarnings` (`EmployeeEarningId`, `SalaryId`, `UserId`, `EarningId`, `EarningAmount`) VALUES (1018, 1007, 35, 1007, 250.00);
INSERT INTO `EmployeeEarnings` (`EmployeeEarningId`, `SalaryId`, `UserId`, `EarningId`, `EarningAmount`) VALUES (1020, 1009, 40, 1007, 2500.00);
INSERT INTO `EmployeeEarnings` (`EmployeeEarningId`, `SalaryId`, `UserId`, `EarningId`, `EarningAmount`) VALUES (1021, 1010, 37, 1007, 1000.00);
INSERT INTO `EmployeeEarnings` (`EmployeeEarningId`, `SalaryId`, `UserId`, `EarningId`, `EarningAmount`) VALUES (1022, 1010, 37, 1008, 1000.00);
INSERT INTO `EmployeeEarnings` (`EmployeeEarningId`, `SalaryId`, `UserId`, `EarningId`, `EarningAmount`) VALUES (1023, 1010, 37, 1009, 1000.00);
INSERT INTO `EmployeeEarnings` (`EmployeeEarningId`, `SalaryId`, `UserId`, `EarningId`, `EarningAmount`) VALUES (1024, 1011, 42, 1007, 2500.00);
INSERT INTO `EmployeeEarnings` (`EmployeeEarningId`, `SalaryId`, `UserId`, `EarningId`, `EarningAmount`) VALUES (1025, 1011, 42, 1008, 2500.00);
INSERT INTO `EmployeeEarnings` (`EmployeeEarningId`, `SalaryId`, `UserId`, `EarningId`, `EarningAmount`) VALUES (1026, 1011, 42, 1009, 2500.00);
INSERT INTO `EmployeeFamilyDetails` (`FamilyDetailId`, `Name`, `Relation`, `DateOfBirth`, `phone`, `UserId`) VALUES (1, 'Admin Executive', 'Brother', '2025-02-05T00:00:00.0000000', '2345632901', 1);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1, 'IT', 'IT', 1, 'Software Developer', '2025-02-04T00:00:00.0000000', 'Suraj', '2025-02-19T00:00:00.0000000', 'HR', '12', 1, 'Personal Excellence', 'Attendance', 2, 8.00, 54, 54.00, 4);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (2, 'IT', 'IT', 1, 'Software Developer', '2025-02-04T00:00:00.0000000', 'Suraj', '2025-02-19T00:00:00.0000000', 'HR', '12', 1, 'Personal Excellence', 'Attendance', 2, 75.00, 4, 4.00, 42);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (3, 'IT', 'IT', 1, 'Software Developer', '2025-02-04T00:00:00.0000000', 'Suraj', '2025-02-19T00:00:00.0000000', 'HR', '12', 1, 'Personal Excellence', 'Attitude & Behavior', 2, 57.00, 4, 4.00, 42);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (4, 'IT', 'IT', 1, 'Software Developer', '2025-02-04T00:00:00.0000000', 'Suraj', '2025-02-19T00:00:00.0000000', 'HR', '12', 1, 'Personal Excellence', 'Attitude & Behavior', 2, 45.00, 4, 42.00, 42);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (5, 'IT', 'IT', 1, 'Software Developer', '2025-02-04T00:00:00.0000000', 'Suraj', '2025-02-19T00:00:00.0000000', 'HR', '12', 1, 'Personal Excellence', 'Policy & Procedures', 2, 4.00, 4, 42.00, 52);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (6, 'IT', 'IT', 1, 'Software Developer', '2025-02-04T00:00:00.0000000', 'Suraj', '2025-02-19T00:00:00.0000000', 'HR', '12', 1, 'Personal Excellence', 'Initiatives', 2, 4.00, 4, 4.00, 1);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (7, 'IT', 'IT', 1, 'Software Developer', '2025-02-04T00:00:00.0000000', 'Suraj', '2025-02-19T00:00:00.0000000', 'HR', '12', 1, 'Personal Excellence', 'Continuous Skill Improvement', 3, 45.00, 4, 4.00, 75);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (8, 'IT', 'IT', 1, 'Software Developer', '2025-02-04T00:00:00.0000000', 'Suraj', '2025-02-19T00:00:00.0000000', 'HR', '12', 1, 'Professional Excellence', 'Production', 30, 4.00, 75, 75.00, 74);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (9, 'IT', 'IT', 1, 'Software Developer', '2025-02-04T00:00:00.0000000', 'Suraj', '2025-02-19T00:00:00.0000000', 'HR', '12', 1, 'Professional Excellence', 'Production', 30, 57.00, 75, 574.00, 754);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (10, 'IT', 'IT', 1, 'Software Developer', '2025-02-04T00:00:00.0000000', 'Suraj', '2025-02-19T00:00:00.0000000', 'HR', '12', 1, 'Professional Excellence', 'Process Improvement', 10, 75.00, 75, 75.00, 754);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (11, 'IT', 'IT', 1, 'Software Developer', '2025-02-04T00:00:00.0000000', 'Suraj', '2025-02-19T00:00:00.0000000', 'HR', '12', 1, 'Professional Excellence', 'Team Management', 5, 75.00, 75, 754.00, 74);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (12, 'IT', 'IT', 1, 'Software Developer', '2025-02-04T00:00:00.0000000', 'Suraj', '2025-02-19T00:00:00.0000000', 'HR', '12', 1, 'Professional Excellence', 'Knowledge Sharing', 5, 75.00, 75, 4.00, 75);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (13, 'IT', 'IT', 1, 'Software Developer', '2025-02-04T00:00:00.0000000', 'Suraj', '2025-02-19T00:00:00.0000000', 'HR', '12', 1, 'Professional Excellence', 'Reporting and Communication', 5, 7.00, 74, 74.00, 754);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1002, 'Admin', 'asasa', 1, 'asas', '2025-01-28T00:00:00.0000000', 'dasa', '2025-02-24T00:00:00.0000000', 'HR', 'asasa', 0, 'Personal Excellence', 'Attendance', 2, 45.00, 34, 45.00, 56);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1003, 'Admin', 'asasa', 1, 'asas', '2025-01-28T00:00:00.0000000', 'dasa', '2025-02-24T00:00:00.0000000', 'HR', 'asasa', 0, 'Personal Excellence', 'Attendance', 2, 34.00, 45, 56.00, 67);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1004, 'Admin', 'asasa', 1, 'asas', '2025-01-28T00:00:00.0000000', 'dasa', '2025-02-24T00:00:00.0000000', 'HR', 'asasa', 0, 'Personal Excellence', 'Attitude & Behavior', 2, 34.00, 56, 45.00, 45);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1005, 'Admin', 'asasa', 1, 'asas', '2025-01-28T00:00:00.0000000', 'dasa', '2025-02-24T00:00:00.0000000', 'HR', 'asasa', 0, 'Personal Excellence', 'Attitude & Behavior', 2, 45.00, 43, 343.00, 232);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1006, 'Admin', 'asasa', 1, 'asas', '2025-01-28T00:00:00.0000000', 'dasa', '2025-02-24T00:00:00.0000000', 'HR', 'asasa', 0, 'Personal Excellence', 'Policy & Procedures', 2, 32.00, 232, 22.00, 32);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1007, 'Admin', 'asasa', 1, 'asas', '2025-01-28T00:00:00.0000000', 'dasa', '2025-02-24T00:00:00.0000000', 'HR', 'asasa', 0, 'Personal Excellence', 'Initiatives', 2, 334.00, 45, 45.00, 67);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1008, 'Admin', 'asasa', 1, 'asas', '2025-01-28T00:00:00.0000000', 'dasa', '2025-02-24T00:00:00.0000000', 'HR', 'asasa', 0, 'Personal Excellence', 'Continuous Skill Improvement', 3, 34.00, 56, 56.00, 67);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1009, 'Admin', 'asasa', 1, 'asas', '2025-01-28T00:00:00.0000000', 'dasa', '2025-02-24T00:00:00.0000000', 'HR', 'asasa', 0, 'Professional Excellence', 'Production', 30, 45.00, 56, 45.00, 34);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1010, 'Admin', 'asasa', 1, 'asas', '2025-01-28T00:00:00.0000000', 'dasa', '2025-02-24T00:00:00.0000000', 'HR', 'asasa', 0, 'Professional Excellence', 'Production', 30, 34.00, 34, 34.00, 34);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1011, 'Admin', 'asasa', 1, 'asas', '2025-01-28T00:00:00.0000000', 'dasa', '2025-02-24T00:00:00.0000000', 'HR', 'asasa', 0, 'Professional Excellence', 'Process Improvement', 10, 34.00, 34, 34.00, 34);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1012, 'Admin', 'asasa', 1, 'asas', '2025-01-28T00:00:00.0000000', 'dasa', '2025-02-24T00:00:00.0000000', 'HR', 'asasa', 0, 'Professional Excellence', 'Team Management', 5, 34.00, 34, 34.00, 34);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1013, 'Admin', 'asasa', 1, 'asas', '2025-01-28T00:00:00.0000000', 'dasa', '2025-02-24T00:00:00.0000000', 'HR', 'asasa', 0, 'Professional Excellence', 'Knowledge Sharing', 5, 34.00, 34, 34.00, 34);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1014, 'Admin', 'asasa', 1, 'asas', '2025-01-28T00:00:00.0000000', 'dasa', '2025-02-24T00:00:00.0000000', 'HR', 'asasa', 0, 'Professional Excellence', 'Reporting and Communication', 5, 43.00, 34, 43.00, 34);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1015, 'Nitesh', 'IT', 12, 'Software Developer', '2025-03-14T00:00:00.0000000', 'John', '2025-03-06T00:00:00.0000000', 'Software Developer', 'None', 4, 'Personal Excellence', 'Attendance', 2, 0.00, 0, 0.00, 0);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1016, 'Nitesh', 'IT', 12, 'Software Developer', '2025-03-14T00:00:00.0000000', 'John', '2025-03-06T00:00:00.0000000', 'Software Developer', 'None', 4, 'Personal Excellence', 'Attendance', 2, 0.00, 0, 0.00, 0);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1017, 'Nitesh', 'IT', 12, 'Software Developer', '2025-03-14T00:00:00.0000000', 'John', '2025-03-06T00:00:00.0000000', 'Software Developer', 'None', 4, 'Personal Excellence', 'Attitude & Behavior', 2, 0.00, 0, 0.00, 0);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1018, 'Nitesh', 'IT', 12, 'Software Developer', '2025-03-14T00:00:00.0000000', 'John', '2025-03-06T00:00:00.0000000', 'Software Developer', 'None', 4, 'Personal Excellence', 'Attitude & Behavior', 2, 0.00, 0, 0.00, 0);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1019, 'Nitesh', 'IT', 12, 'Software Developer', '2025-03-14T00:00:00.0000000', 'John', '2025-03-06T00:00:00.0000000', 'Software Developer', 'None', 4, 'Personal Excellence', 'Policy & Procedures', 2, 0.00, 0, 0.00, 0);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1020, 'Nitesh', 'IT', 12, 'Software Developer', '2025-03-14T00:00:00.0000000', 'John', '2025-03-06T00:00:00.0000000', 'Software Developer', 'None', 4, 'Personal Excellence', 'Initiatives', 2, 0.00, 0, 0.00, 0);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1021, 'Nitesh', 'IT', 12, 'Software Developer', '2025-03-14T00:00:00.0000000', 'John', '2025-03-06T00:00:00.0000000', 'Software Developer', 'None', 4, 'Personal Excellence', 'Continuous Skill Improvement', 3, 0.00, 0, 0.00, 0);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1022, 'Nitesh', 'IT', 12, 'Software Developer', '2025-03-14T00:00:00.0000000', 'John', '2025-03-06T00:00:00.0000000', 'Software Developer', 'None', 4, 'Professional Excellence', 'Production', 30, 0.00, 0, 0.00, 0);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1023, 'Nitesh', 'IT', 12, 'Software Developer', '2025-03-14T00:00:00.0000000', 'John', '2025-03-06T00:00:00.0000000', 'Software Developer', 'None', 4, 'Professional Excellence', 'Production', 30, 0.00, 0, 0.00, 0);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1024, 'Nitesh', 'IT', 12, 'Software Developer', '2025-03-14T00:00:00.0000000', 'John', '2025-03-06T00:00:00.0000000', 'Software Developer', 'None', 4, 'Professional Excellence', 'Process Improvement', 10, 0.00, 0, 0.00, 0);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1025, 'Nitesh', 'IT', 12, 'Software Developer', '2025-03-14T00:00:00.0000000', 'John', '2025-03-06T00:00:00.0000000', 'Software Developer', 'None', 4, 'Professional Excellence', 'Team Management', 5, 0.00, 0, 0.00, 0);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1026, 'Nitesh', 'IT', 12, 'Software Developer', '2025-03-14T00:00:00.0000000', 'John', '2025-03-06T00:00:00.0000000', 'Software Developer', 'None', 4, 'Professional Excellence', 'Knowledge Sharing', 5, 0.00, 0, 0.00, 0);
INSERT INTO `EmployeePerformances` (`ID`, `Name`, `Department`, `EmployeeId`, `Designation`, `DateofJoin`, `ROName`, `DateofConfirmation`, `RODesignation`, `Qualification`, `PreviousyearsofExp`, `Category`, `Sub_Category`, `Weightage`, `Percentage_Achieved_Self`, `Points_Scored_Self`, `Percentage_Achieved_RO`, `Points_Scored_RO`) VALUES (1027, 'Nitesh', 'IT', 12, 'Software Developer', '2025-03-14T00:00:00.0000000', 'John', '2025-03-06T00:00:00.0000000', 'Software Developer', 'None', 4, 'Professional Excellence', 'Reporting and Communication', 5, 0.00, 0, 0.00, 0);
INSERT INTO `EmployeeSalaries` (`SalaryId`, `UserId`, `TotalSalary`, `NetSalary`, `CreatedDate`, `UpdatedDate`) VALUES (1, 1, 500.00, 565.00, '2025-02-07T16:56:45.3098083', NULL);
INSERT INTO `EmployeeSalaries` (`SalaryId`, `UserId`, `TotalSalary`, `NetSalary`, `CreatedDate`, `UpdatedDate`) VALUES (1006, 38, 5000.00, -250.00, '2025-02-27T10:40:35.4834646', NULL);
INSERT INTO `EmployeeSalaries` (`SalaryId`, `UserId`, `TotalSalary`, `NetSalary`, `CreatedDate`, `UpdatedDate`) VALUES (1007, 35, 5000.00, -250.00, '2025-03-01T16:56:51.3162621', NULL);
INSERT INTO `EmployeeSalaries` (`SalaryId`, `UserId`, `TotalSalary`, `NetSalary`, `CreatedDate`, `UpdatedDate`) VALUES (1009, 40, 50000.00, -2500.00, '2025-03-04T10:29:43.4019813', NULL);
INSERT INTO `EmployeeSalaries` (`SalaryId`, `UserId`, `TotalSalary`, `NetSalary`, `CreatedDate`, `UpdatedDate`) VALUES (1010, 37, 20000.00, -3000.00, '2026-09-05T10:36:20.8588928', NULL);
INSERT INTO `EmployeeSalaries` (`SalaryId`, `UserId`, `TotalSalary`, `NetSalary`, `CreatedDate`, `UpdatedDate`) VALUES (1011, 42, 50000.00, -7500.00, '2026-09-05T15:28:44.4194556', NULL);
INSERT INTO `Events` (`Id`, `Title`, `Date`, `EventTypeId`, `Status`) VALUES (5, 'Mahashivratri', '2025-02-26', 5, 'Active');
INSERT INTO `Events` (`Id`, `Title`, `Date`, `EventTypeId`, `Status`) VALUES (7, 'Holi', '2025-03-14', 5, 'Active');
INSERT INTO `Events` (`Id`, `Title`, `Date`, `EventTypeId`, `Status`) VALUES (8, 'Ramjan', '2025-03-26', 5, 'Active');
INSERT INTO `Events` (`Id`, `Title`, `Date`, `EventTypeId`, `Status`) VALUES (9, 'Indep Day', '2026-08-15', 5, 'Active');
INSERT INTO `Events` (`Id`, `Title`, `Date`, `EventTypeId`, `Status`) VALUES (10, 'Ganesh Chat', '2026-09-14', 5, 'Active');
INSERT INTO `Events` (`Id`, `Title`, `Date`, `EventTypeId`, `Status`) VALUES (11, 'Masstech Birthday', '2026-09-15', 6, 'Active');
INSERT INTO `EventTypes` (`Id`, `Name`, `Color`) VALUES (5, 'Holiday', '#563d7c');
INSERT INTO `EventTypes` (`Id`, `Name`, `Color`) VALUES (6, 'Birthday', '#e42807');
INSERT INTO `Experience` (`ExperienceId`, `DesignationName`, `FromDate`, `ToDate`, `UserId`, `CompanyName`) VALUES (1, 'Software Engineer', '0001-01-01T00:00:00.0000000', '2025-12-02T00:00:00.0000000', 1, 'Google');
INSERT INTO `FileUploads` (`id`, `FileName`, `FilePath`, `UserId`) VALUES (4, 'Appointment Letter', 'uploads/5955088b-a558-46eb-8bf4-7bdd64f1c7e7.pdf', 35);
INSERT INTO `FileUploads` (`id`, `FileName`, `FilePath`, `UserId`) VALUES (5, 'Confirmation Letter', 'uploads/bef89608-3589-4e3b-bfa4-54471d9db9e5.pdf', 35);
INSERT INTO `FileUploads` (`id`, `FileName`, `FilePath`, `UserId`) VALUES (6, 'Appointment Letter', 'uploads/2dbd4b5c-0a64-424a-90ac-63391fbeb905.pdf', 42);
INSERT INTO `FileUploads` (`id`, `FileName`, `FilePath`, `UserId`) VALUES (7, 'Confirmation Letter', 'uploads/268c8200-ed64-41f1-8bec-7685e5b24fbe.pdf', 42);
INSERT INTO `FileUploads` (`id`, `FileName`, `FilePath`, `UserId`) VALUES (8, 'ITR', 'uploads/2ec43222-eaaa-4c88-8c02-c4a2c276b238.bak', 42);
INSERT INTO `FileUploads` (`id`, `FileName`, `FilePath`, `UserId`) VALUES (9, 'HSC Marksheet', 'uploads/318b3fc3-590a-4c40-a475-dcba2229170e.jpeg', 37);
INSERT INTO `FileUploads` (`id`, `FileName`, `FilePath`, `UserId`) VALUES (10, 'Appraisal Letter', 'uploads/21ff5273-f616-4b32-b73e-7ad010a22c01.jpg', 37);
INSERT INTO `GoalTrackingList` (`GoalTrackingId`, `Subject`, `TargetAchievement`, `StartDate`, `EndDate`, `Description`, `Status`, `GoalId`) VALUES (5, 'Test123', '300', '2025-02-07T00:00:00.0000000', '2025-02-27T00:00:00.0000000', 'nill', 'Active', 6);
INSERT INTO `GoalTypeList` (`GoalId`, `GoalType`, `Description`, `Status`) VALUES (6, 'Target', 'Testing Phase', 'Active');
INSERT INTO `KnowledgeBaseTopics` (`Id`, `MasterTopic`) VALUES (1, 'Full stack developer');
INSERT INTO `KnowledgeBaseTopics` (`Id`, `MasterTopic`) VALUES (2, 'Full stack developer');
INSERT INTO `KnowledgeBaseTopics` (`Id`, `MasterTopic`) VALUES (3, 'Full stack developer');
INSERT INTO `KnowledgeBaseTopics` (`Id`, `MasterTopic`) VALUES (4, '.net developer');
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (35, 35, 7, 4, 5, 0);
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (36, 36, 7, 4, 5, 0);
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (37, 37, 7, 4, 5, 2);
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (38, 38, 7, 4, 5, 0);
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (39, 40, 7, 4, 5, 0);
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (40, 42, 7, 4, 5, 2);
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (41, 35, 8, 5, 4, 0);
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (42, 36, 8, 5, 4, 0);
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (43, 37, 8, 5, 4, 0);
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (44, 38, 8, 5, 4, 0);
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (45, 40, 8, 5, 4, 0);
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (46, 42, 8, 5, 4, 0);
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (47, 35, 14, 8, 10, 0);
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (48, 36, 14, 8, 10, 0);
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (49, 37, 14, 8, 10, 0);
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (50, 38, 14, 8, 10, 0);
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (51, 40, 14, 8, 10, 0);
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (52, 42, 14, 8, 10, 0);
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (53, 35, 15, 9, 6, 0);
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (54, 36, 15, 9, 6, 0);
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (55, 37, 15, 9, 6, 0);
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (56, 38, 15, 9, 6, 0);
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (57, 40, 15, 9, 6, 0);
INSERT INTO `LeaveBalances` (`LeaveBalanceId`, `UserId`, `DepartmentLeavesId`, `LeaveTypeId`, `TotalLeaves`, `UsedLeaves`) VALUES (58, 42, 15, 9, 6, 0);
INSERT INTO `LeaveRequests` (`LeaveRequestId`, `UserId`, `LeaveTypeId`, `StartDate`, `EndDate`, `NumberOfDays`, `Reason`, `ApprovedBy`, `Status`, `StatusHistory`) VALUES (11, 37, 4, '2025-03-13T00:00:00.0000000', '2025-03-15T00:00:00.0000000', 3, 'nill', 'Krish', 'Rejected', '
Approved on 3/1/2025 1:22:51 PM
Rejected on 3/1/2025 1:23:17 PM');
INSERT INTO `LeaveRequests` (`LeaveRequestId`, `UserId`, `LeaveTypeId`, `StartDate`, `EndDate`, `NumberOfDays`, `Reason`, `ApprovedBy`, `Status`, `StatusHistory`) VALUES (12, 37, 4, '2025-03-13T00:00:00.0000000', '2025-03-15T00:00:00.0000000', 2, 'nill', 'Krish', 'Approved', '
Approved on 3/1/2025 1:29:11 PM');
INSERT INTO `LeaveRequests` (`LeaveRequestId`, `UserId`, `LeaveTypeId`, `StartDate`, `EndDate`, `NumberOfDays`, `Reason`, `ApprovedBy`, `Status`, `StatusHistory`) VALUES (13, 37, 4, '2025-03-14T00:00:00.0000000', '2025-03-15T00:00:00.0000000', 2, 'nill', 'Krish', 'Rejected', '
Rejected on 3/1/2025 1:31:49 PM
Approved on 3/1/2025 1:32:09 PM
Rejected on 3/1/2025 2:30:03 PM');
INSERT INTO `LeaveRequests` (`LeaveRequestId`, `UserId`, `LeaveTypeId`, `StartDate`, `EndDate`, `NumberOfDays`, `Reason`, `ApprovedBy`, `Status`, `StatusHistory`) VALUES (14, 37, 4, '2025-02-25T00:00:00.0000000', '2025-02-27T00:00:00.0000000', 3, 'nill', 'Krish', 'Rejected', '
Rejected on 3/1/2025 2:37:49 PM');
INSERT INTO `LeaveRequests` (`LeaveRequestId`, `UserId`, `LeaveTypeId`, `StartDate`, `EndDate`, `NumberOfDays`, `Reason`, `ApprovedBy`, `Status`, `StatusHistory`) VALUES (15, 37, 4, '2025-02-25T00:00:00.0000000', '2025-02-27T00:00:00.0000000', 2, 'nill', 'Krish', 'Rejected', '
Rejected on 3/1/2025 3:14:13 PM');
INSERT INTO `LeaveRequests` (`LeaveRequestId`, `UserId`, `LeaveTypeId`, `StartDate`, `EndDate`, `NumberOfDays`, `Reason`, `ApprovedBy`, `Status`, `StatusHistory`) VALUES (16, 37, 4, '2025-02-25T00:00:00.0000000', '2025-02-27T00:00:00.0000000', 2, 'nill', 'Krish', 'Rejected', '
Approved on 3/1/2025 3:08:22 PM
Rejected on 3/1/2025 3:14:08 PM');
INSERT INTO `LeaveRequests` (`LeaveRequestId`, `UserId`, `LeaveTypeId`, `StartDate`, `EndDate`, `NumberOfDays`, `Reason`, `ApprovedBy`, `Status`, `StatusHistory`) VALUES (17, 37, 4, '2025-03-13T00:00:00.0000000', '2025-03-15T00:00:00.0000000', 3, 'nill', 'Krish', 'Rejected', '
Rejected on 3/1/2025 3:17:08 PM');
INSERT INTO `LeaveRequests` (`LeaveRequestId`, `UserId`, `LeaveTypeId`, `StartDate`, `EndDate`, `NumberOfDays`, `Reason`, `ApprovedBy`, `Status`, `StatusHistory`) VALUES (18, 37, 4, '2025-02-25T00:00:00.0000000', '2025-02-27T00:00:00.0000000', 2, 'nill', '', 'Pending', '');
INSERT INTO `LeaveRequests` (`LeaveRequestId`, `UserId`, `LeaveTypeId`, `StartDate`, `EndDate`, `NumberOfDays`, `Reason`, `ApprovedBy`, `Status`, `StatusHistory`) VALUES (19, 42, 4, '2025-03-13T00:00:00.0000000', '2025-03-15T00:00:00.0000000', 2, 'PL', 'Krish', 'Approved', '
Rejected on 3/2/2025 5:32:14 PM
Approved on 3/2/2025 5:33:28 PM');
INSERT INTO `LeaveRequests` (`LeaveRequestId`, `UserId`, `LeaveTypeId`, `StartDate`, `EndDate`, `NumberOfDays`, `Reason`, `ApprovedBy`, `Status`, `StatusHistory`) VALUES (20, 42, 4, '2025-03-10T00:00:00.0000000', '2025-03-11T00:00:00.0000000', 2, 'nill', 'Krish', 'Rejected', '
Approved on 3/2/2025 5:35:01 PM
Rejected on 3/2/2025 5:35:23 PM');
INSERT INTO `LeaveRequests` (`LeaveRequestId`, `UserId`, `LeaveTypeId`, `StartDate`, `EndDate`, `NumberOfDays`, `Reason`, `ApprovedBy`, `Status`, `StatusHistory`) VALUES (21, 37, 4, '2026-08-13T00:00:00.0000000', '2026-08-16T00:00:00.0000000', 3, 'Nan', 'Krish', 'Rejected', '
Approved on 8/24/2026 2:55:19 PM
Rejected on 8/24/2026 2:56:06 PM');
INSERT INTO `LeaveRequests` (`LeaveRequestId`, `UserId`, `LeaveTypeId`, `StartDate`, `EndDate`, `NumberOfDays`, `Reason`, `ApprovedBy`, `Status`, `StatusHistory`) VALUES (22, 37, 4, '2026-09-12T00:00:00.0000000', '2026-09-15T00:00:00.0000000', 3, 'NAN', 'Krish', 'Rejected', '
Approved on 9/5/2026 10:22:04 AM
Rejected on 9/5/2026 10:23:24 AM');
INSERT INTO `LeaveRequests` (`LeaveRequestId`, `UserId`, `LeaveTypeId`, `StartDate`, `EndDate`, `NumberOfDays`, `Reason`, `ApprovedBy`, `Status`, `StatusHistory`) VALUES (23, 37, 4, '2026-09-12T00:00:00.0000000', '2026-09-15T00:00:00.0000000', 3, 'NAN', 'Krish', 'Rejected', '
Approved on 9/5/2026 3:17:57 PM
Rejected on 9/5/2026 3:19:15 PM');
INSERT INTO `MasterLeaveTypes` (`LeaveTypeId`, `LeaveType`) VALUES (4, 'Paid Leave');
INSERT INTO `MasterLeaveTypes` (`LeaveTypeId`, `LeaveType`) VALUES (5, 'Sick Leave');
INSERT INTO `MasterLeaveTypes` (`LeaveTypeId`, `LeaveType`) VALUES (6, 'CL');
INSERT INTO `MasterLeaveTypes` (`LeaveTypeId`, `LeaveType`) VALUES (7, 'ML');
INSERT INTO `MasterLeaveTypes` (`LeaveTypeId`, `LeaveType`) VALUES (8, 'Unpaid Leave');
INSERT INTO `MasterLeaveTypes` (`LeaveTypeId`, `LeaveType`) VALUES (9, 'Test Leave');
INSERT INTO `Organization` (`OrganizationId`, `OrganizationName`, `OrganizationDescription`, `OrganizationAddress`, `OrganizationPhone`, `OrganizationEmail`, `OrganizationLogo`) VALUES (4, 'Pal Software', 'Nill', 'Nill', '7208921898', 'pal@gmail.com', '/Uploads/logos/17d7a359-585b-436b-a0c0-55e10f8eff3d.png');
INSERT INTO `Payslips` (`PayslipId`, `UserId`, `Month`, `Year`, `PayslipPath`, `GeneratedOn`) VALUES (27, 35, 'March', 2025, 'C:\Users\finan\Downloads\Pulse360 (2) (2)Lat\Pulse360\Pulse360\Pulse360\wwwroot\payslips\Payslip_Krish_March_2025.pdf', '2025-03-04T10:31:03.0104694');
INSERT INTO `Payslips` (`PayslipId`, `UserId`, `Month`, `Year`, `PayslipPath`, `GeneratedOn`) VALUES (28, 38, 'March', 2025, 'C:\Users\finan\Downloads\Pulse360 (2) (2)Lat\Pulse360\Pulse360\Pulse360\wwwroot\payslips\Payslip_Jack_March_2025.pdf', '2025-03-04T10:31:07.7040208');
INSERT INTO `Payslips` (`PayslipId`, `UserId`, `Month`, `Year`, `PayslipPath`, `GeneratedOn`) VALUES (29, 40, 'March', 2025, 'C:\Users\finan\Downloads\Pulse360 (2) (2)Lat\Pulse360\Pulse360\Pulse360\wwwroot\payslips\Payslip_Harish_March_2025.pdf', '2025-03-04T10:31:11.6770904');
INSERT INTO `Payslips` (`PayslipId`, `UserId`, `Month`, `Year`, `PayslipPath`, `GeneratedOn`) VALUES (30, 37, 'August', 2026, 'C:\Users\Masstech\source\repos\Pulse360\Pulse360\wwwroot\payslips\Payslip_Ram_August_2026.pdf', '2026-09-05T10:37:06.9217673');
INSERT INTO `Payslips` (`PayslipId`, `UserId`, `Month`, `Year`, `PayslipPath`, `GeneratedOn`) VALUES (31, 42, 'August', 2026, 'C:\Users\Masstech\source\repos\Pulse360\Pulse360\wwwroot\payslips\Payslip_Nitesh_August_2026.pdf', '2026-09-05T15:29:07.4046154');
INSERT INTO `PerformanceAppriasal` (`PerformanceAppriasalId`, `AppraisalDate`, `Status`, `CustomerExperience`, `Marketing`, `Management`, `Administration`, `PresentationSkills`, `QualityofWork`, `Efficiency`, `Integrity`, `Professionalism`, `TeamWork`, `CriticalThinking`, `ConflictManagement`, `Attendance`, `AbilityToMeetDeadline`, `UserId`, `DepartmentId`, `DesignationId`) VALUES (6, '2025-03-06T00:00:00.0000000', 'Active', 'Intermediate', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'Advanced', 'None', 'None', 'None', 'None', 42, 25, 12);
INSERT INTO `PerformanceAppriasal` (`PerformanceAppriasalId`, `AppraisalDate`, `Status`, `CustomerExperience`, `Marketing`, `Management`, `Administration`, `PresentationSkills`, `QualityofWork`, `Efficiency`, `Integrity`, `Professionalism`, `TeamWork`, `CriticalThinking`, `ConflictManagement`, `Attendance`, `AbilityToMeetDeadline`, `UserId`, `DepartmentId`, `DesignationId`) VALUES (7, '2025-03-20T00:00:00.0000000', 'Active', 'Beginner', 'Intermediate', 'Intermediate', 'Advanced', 'None', 'Advanced', 'Advanced', 'Intermediate', 'Advanced', 'Beginner', 'Advanced', 'Expert / Leader', 'Expert / Leader', 'Intermediate', 40, 25, 12);
INSERT INTO `PerformanceAppriasal` (`PerformanceAppriasalId`, `AppraisalDate`, `Status`, `CustomerExperience`, `Marketing`, `Management`, `Administration`, `PresentationSkills`, `QualityofWork`, `Efficiency`, `Integrity`, `Professionalism`, `TeamWork`, `CriticalThinking`, `ConflictManagement`, `Attendance`, `AbilityToMeetDeadline`, `UserId`, `DepartmentId`, `DesignationId`) VALUES (8, '2025-03-12T00:00:00.0000000', 'Active', 'Intermediate', 'Advanced', 'Intermediate', 'Beginner', 'Advanced', 'Expert / Leader', 'Expert / Leader', 'Intermediate', 'Advanced', 'Intermediate', 'Beginner', 'Expert / Leader', 'Expert / Leader', 'Beginner', 36, 25, 12);
INSERT INTO `PerformanceIndicators` (`PerformanceIndicatorId`, `ApprovedBy`, `CreatedAt`, `Status`, `CustomerExperience`, `Marketing`, `Management`, `Administration`, `PresentationSkills`, `QualityofWork`, `Efficiency`, `Integrity`, `Professionalism`, `TeamWork`, `CriticalThinking`, `ConflictManagement`, `Attendance`, `AbilityToMeetDeadline`, `DepartmentId`, `DesignationId`) VALUES (1004, 'Admin', '2025-02-24T23:53:56.3474739', 'Active', 'Advanced', 'Intermediate', 'Select', 'Select', 'Select', 'Select', 'Select', 'Select', 'Select', 'Select', 'Select', 'Select', 'Select', 'Select', 26, 15);
INSERT INTO `PerformanceIndicators` (`PerformanceIndicatorId`, `ApprovedBy`, `CreatedAt`, `Status`, `CustomerExperience`, `Marketing`, `Management`, `Administration`, `PresentationSkills`, `QualityofWork`, `Efficiency`, `Integrity`, `Professionalism`, `TeamWork`, `CriticalThinking`, `ConflictManagement`, `Attendance`, `AbilityToMeetDeadline`, `DepartmentId`, `DesignationId`) VALUES (1005, 'Admin', '2025-03-01T18:49:34.6282544', 'Active', 'Select', 'Select', 'Select', 'Select', 'Select', 'Select', 'Select', 'Select', 'Select', 'Select', 'Select', 'Select', 'Select', 'Select', 25, 12);
INSERT INTO `ProjectsUser` (`ProjectsProjectId`, `UsersUserId`) VALUES (16, 35);
INSERT INTO `ProjectsUser` (`ProjectsProjectId`, `UsersUserId`) VALUES (15, 36);
INSERT INTO `ProjectsUser` (`ProjectsProjectId`, `UsersUserId`) VALUES (21, 36);
INSERT INTO `ProjectsUser` (`ProjectsProjectId`, `UsersUserId`) VALUES (15, 37);
INSERT INTO `ProjectsUser` (`ProjectsProjectId`, `UsersUserId`) VALUES (20, 37);
INSERT INTO `ProjectsUser` (`ProjectsProjectId`, `UsersUserId`) VALUES (21, 37);
INSERT INTO `ProjectsUser` (`ProjectsProjectId`, `UsersUserId`) VALUES (16, 38);
INSERT INTO `ProjectsUser` (`ProjectsProjectId`, `UsersUserId`) VALUES (19, 38);
INSERT INTO `ProjectsUser` (`ProjectsProjectId`, `UsersUserId`) VALUES (15, 40);
INSERT INTO `ProjectsUser` (`ProjectsProjectId`, `UsersUserId`) VALUES (18, 40);
INSERT INTO `ProjectsUser` (`ProjectsProjectId`, `UsersUserId`) VALUES (19, 40);
INSERT INTO `ProjectsUser` (`ProjectsProjectId`, `UsersUserId`) VALUES (20, 40);
INSERT INTO `ProjectsUser` (`ProjectsProjectId`, `UsersUserId`) VALUES (21, 40);
INSERT INTO `ProjectsUser` (`ProjectsProjectId`, `UsersUserId`) VALUES (18, 42);
INSERT INTO `ProjectsUser` (`ProjectsProjectId`, `UsersUserId`) VALUES (19, 42);
INSERT INTO `ProjectsUser` (`ProjectsProjectId`, `UsersUserId`) VALUES (20, 42);
INSERT INTO `Promotion` (`PromotionId`, `UserID`, `DesignationFrom`, `DesignationTo`, `Date`) VALUES (6, 35, 'Software Developer', 'Sales', '2025-02-28T00:00:00.0000000');
INSERT INTO `Promotion` (`PromotionId`, `UserID`, `DesignationFrom`, `DesignationTo`, `Date`) VALUES (7, 1, 'Sales', 'Software Developer', '2025-02-27T00:00:00.0000000');
INSERT INTO `Promotion` (`PromotionId`, `UserID`, `DesignationFrom`, `DesignationTo`, `Date`) VALUES (10, 42, 'Software Developer', 'Sales', '2025-03-18T00:00:00.0000000');
INSERT INTO `Promotion` (`PromotionId`, `UserID`, `DesignationFrom`, `DesignationTo`, `Date`) VALUES (11, 36, 'Sales', 'Software Developer', '2025-03-14T00:00:00.0000000');
INSERT INTO `Promotion` (`PromotionId`, `UserID`, `DesignationFrom`, `DesignationTo`, `Date`) VALUES (12, 42, 'Software Developer', 'Sales', '2026-08-27T00:00:00.0000000');
INSERT INTO `Promotion` (`PromotionId`, `UserID`, `DesignationFrom`, `DesignationTo`, `Date`) VALUES (13, 37, 'Software Developer', 'Sales', '2026-09-09T00:00:00.0000000');
INSERT INTO `Promotion` (`PromotionId`, `UserID`, `DesignationFrom`, `DesignationTo`, `Date`) VALUES (14, 42, 'Software Developer', 'Sales', '2026-09-10T00:00:00.0000000');
INSERT INTO `Resignation` (`ResignationId`, `UserID`, `DepartmentId`, `NoticeDate`, `ResignDate`, `Reason`) VALUES (11, 40, 25, '2025-02-13T00:00:00.0000000', '2025-02-26T00:00:00.0000000', 'need more description in ');
INSERT INTO `Resignation` (`ResignationId`, `UserID`, `DepartmentId`, `NoticeDate`, `ResignDate`, `Reason`) VALUES (15, 42, 25, '2025-03-20T00:00:00.0000000', '2025-03-26T00:00:00.0000000', 'there is no content');
INSERT INTO `Resignation` (`ResignationId`, `UserID`, `DepartmentId`, `NoticeDate`, `ResignDate`, `Reason`) VALUES (16, 42, 25, '2025-03-20T00:00:00.0000000', '2025-03-26T00:00:00.0000000', 'there is no content');
INSERT INTO `Resignation` (`ResignationId`, `UserID`, `DepartmentId`, `NoticeDate`, `ResignDate`, `Reason`) VALUES (17, 36, 25, '2025-03-04T00:00:00.0000000', '2025-03-20T00:00:00.0000000', 'None of the Above');
INSERT INTO `Resignation` (`ResignationId`, `UserID`, `DepartmentId`, `NoticeDate`, `ResignDate`, `Reason`) VALUES (18, 42, 25, '2026-08-26T00:00:00.0000000', '2026-08-28T00:00:00.0000000', 'will discuss later');
INSERT INTO `Resignation` (`ResignationId`, `UserID`, `DepartmentId`, `NoticeDate`, `ResignDate`, `Reason`) VALUES (19, 37, 25, '2026-09-12T00:00:00.0000000', '2026-09-23T00:00:00.0000000', 'we will think later');
INSERT INTO `Resignation` (`ResignationId`, `UserID`, `DepartmentId`, `NoticeDate`, `ResignDate`, `Reason`) VALUES (20, 40, 25, '2026-09-10T00:00:00.0000000', '2026-09-16T00:00:00.0000000', 'Not decided');
INSERT INTO `Role` (`RoleId`, `RoleName`, `Status`, `CreatedAt`, `CreatedBy`, `ModifiedBy`, `ModifiedAt`) VALUES (3, 'Admin', 'Active', NULL, NULL, NULL, NULL);
INSERT INTO `Role` (`RoleId`, `RoleName`, `Status`, `CreatedAt`, `CreatedBy`, `ModifiedBy`, `ModifiedAt`) VALUES (8, 'Manager', 'Active', NULL, NULL, 'admin', '2025-02-23T16:25:05.710');
INSERT INTO `Role` (`RoleId`, `RoleName`, `Status`, `CreatedAt`, `CreatedBy`, `ModifiedBy`, `ModifiedAt`) VALUES (10, 'Employee', 'Active', NULL, NULL, NULL, NULL);
INSERT INTO `Role` (`RoleId`, `RoleName`, `Status`, `CreatedAt`, `CreatedBy`, `ModifiedBy`, `ModifiedAt`) VALUES (11, 'Test1', 'Active', '2025-03-01T12:43:51.637', 'admin', NULL, NULL);
INSERT INTO `Role` (`RoleId`, `RoleName`, `Status`, `CreatedAt`, `CreatedBy`, `ModifiedBy`, `ModifiedAt`) VALUES (12, 'Test2', 'Inactive', '2025-03-01T12:44:04.290', 'admin', 'admin', '2025-03-05T07:44:38.853');
INSERT INTO `subTopics` (`Id`, `Title`, `KnowledgeBaseTopicId`) VALUES (1, 'C#', 1);
INSERT INTO `subTopics` (`Id`, `Title`, `KnowledgeBaseTopicId`) VALUES (2, 'C#', 1);
INSERT INTO `subTopics` (`Id`, `Title`, `KnowledgeBaseTopicId`) VALUES (3, 'C#', 1);
INSERT INTO `subTopics` (`Id`, `Title`, `KnowledgeBaseTopicId`) VALUES (4, 'C#', 1);
INSERT INTO `subTopics` (`Id`, `Title`, `KnowledgeBaseTopicId`) VALUES (5, 'C#', 1);
INSERT INTO `subTopics` (`Id`, `Title`, `KnowledgeBaseTopicId`) VALUES (6, 'C#', 1);
INSERT INTO `subTopics` (`Id`, `Title`, `KnowledgeBaseTopicId`) VALUES (7, 'C#', 2);
INSERT INTO `subTopics` (`Id`, `Title`, `KnowledgeBaseTopicId`) VALUES (8, 'C#', 2);
INSERT INTO `subTopics` (`Id`, `Title`, `KnowledgeBaseTopicId`) VALUES (9, 'C#', 3);
INSERT INTO `subTopics` (`Id`, `Title`, `KnowledgeBaseTopicId`) VALUES (10, 'C#', 3);
INSERT INTO `subTopics` (`Id`, `Title`, `KnowledgeBaseTopicId`) VALUES (11, 'C#', 3);
INSERT INTO `subTopics` (`Id`, `Title`, `KnowledgeBaseTopicId`) VALUES (12, 'html', 4);
INSERT INTO `subTopics` (`Id`, `Title`, `KnowledgeBaseTopicId`) VALUES (13, 'css', 4);
INSERT INTO `subTopics` (`Id`, `Title`, `KnowledgeBaseTopicId`) VALUES (14, 'C#', 4);
INSERT INTO `subTopics` (`Id`, `Title`, `KnowledgeBaseTopicId`) VALUES (15, 'Python', 4);
INSERT INTO `subTopics` (`Id`, `Title`, `KnowledgeBaseTopicId`) VALUES (16, 'Java', 4);
INSERT INTO `Task` (`TaskId`, `ProjectId`, `Title`, `Description`, `Status`, `Priority`, `FilePath`, `Deadline`) VALUES (18, 15, 'Hospital Task 1', 'nill', 'Inprogress', 'Medium', '/uploads/850b2ba1-22d6-4417-b2fe-7066aa580cc8_UsersList.pdf', '2025-02-28T00:00:00.0000000');
INSERT INTO `Task` (`TaskId`, `ProjectId`, `Title`, `Description`, `Status`, `Priority`, `FilePath`, `Deadline`) VALUES (19, 16, 'Rest Task 1', 'nill', 'Completed', 'High', '/uploads/abf890be-9a17-468f-8b8a-b9f2497dac9d_UsersList.pdf', '2025-02-25T00:00:00.0000000');
INSERT INTO `Task` (`TaskId`, `ProjectId`, `Title`, `Description`, `Status`, `Priority`, `FilePath`, `Deadline`) VALUES (20, 15, 'Hospital Task2', 'Nill', 'Pending', 'High', '/uploads/32be2fcb-2af1-4d31-8d9c-92acfdd94501_UsersList.pdf', '2025-02-20T00:00:00.0000000');
INSERT INTO `Task` (`TaskId`, `ProjectId`, `Title`, `Description`, `Status`, `Priority`, `FilePath`, `Deadline`) VALUES (22, 16, 'Rest Task 2', 'nill', 'Pending', 'High', '/uploads/84cb022d-efb7-4b48-a1f9-b7c367fbb528_EstatePro Project.docx', '2025-02-20T00:00:00.0000000');
INSERT INTO `Task` (`TaskId`, `ProjectId`, `Title`, `Description`, `Status`, `Priority`, `FilePath`, `Deadline`) VALUES (23, 15, 'Hospital Task 3', 'nill', 'Inprogress', 'High', '/uploads/0c2d06cd-f728-4653-aa35-c5ab002ef3e2_UsersList.pdf', '2025-02-13T00:00:00.0000000');
INSERT INTO `Task` (`TaskId`, `ProjectId`, `Title`, `Description`, `Status`, `Priority`, `FilePath`, `Deadline`) VALUES (24, 16, 'Rest', 'Nill', 'Onhold', 'Medium', '/uploads/01ca3aea-cd41-4e87-aac7-e6a3ef6f02d5_UsersList.pdf', '2025-02-15T00:00:00.0000000');
INSERT INTO `Task` (`TaskId`, `ProjectId`, `Title`, `Description`, `Status`, `Priority`, `FilePath`, `Deadline`) VALUES (25, 16, 'Rest', 'nill', 'Pending', 'Low', '/uploads/06aa3042-8b3f-48b8-bad1-8364a36b93d9_UsersList.pdf', '2025-02-14T00:00:00.0000000');
INSERT INTO `Task` (`TaskId`, `ProjectId`, `Title`, `Description`, `Status`, `Priority`, `FilePath`, `Deadline`) VALUES (26, 18, 'Estate Task 1', 'Nill', 'Onhold', 'High', '/uploads/e5b9cccc-1a5a-4bd1-b074-771b461f7c37_UsersList.pdf', '2025-03-12T00:00:00.0000000');
INSERT INTO `Task` (`TaskId`, `ProjectId`, `Title`, `Description`, `Status`, `Priority`, `FilePath`, `Deadline`) VALUES (27, 18, 'Estate Task 2', 'Nill', 'Onhold', 'Medium', '/uploads/182befca-0c99-4106-bbfc-385626d9fd3f_UsersList.pdf', '2025-03-05T00:00:00.0000000');
INSERT INTO `Task` (`TaskId`, `ProjectId`, `Title`, `Description`, `Status`, `Priority`, `FilePath`, `Deadline`) VALUES (28, 20, 'Leave Module', 'None', 'Pending', 'High', '/uploads/79d14c7d-e6f2-44d0-8634-9081caad16b7_user1.jpg', '2026-08-26T00:00:00.0000000');
INSERT INTO `TaskBoards` (`TaskBoardId`, `ProjectId`, `TaskId`, `Percentage`, `DueDate`, `TasksTaskId`) VALUES (1, 15, 18, 20, '2025-02-19T00:00:00.0000000', NULL);
INSERT INTO `TaskBoards` (`TaskBoardId`, `ProjectId`, `TaskId`, `Percentage`, `DueDate`, `TasksTaskId`) VALUES (2, 15, 19, 30, '2025-02-27T00:00:00.0000000', NULL);
INSERT INTO `TaskBoards` (`TaskBoardId`, `ProjectId`, `TaskId`, `Percentage`, `DueDate`, `TasksTaskId`) VALUES (3, 15, 23, 75, '2025-02-17T00:00:00.0000000', NULL);
INSERT INTO `TaskBoards` (`TaskBoardId`, `ProjectId`, `TaskId`, `Percentage`, `DueDate`, `TasksTaskId`) VALUES (4, 16, 19, 80, '2025-02-14T00:00:00.0000000', NULL);
INSERT INTO `TaskBoards` (`TaskBoardId`, `ProjectId`, `TaskId`, `Percentage`, `DueDate`, `TasksTaskId`) VALUES (5, 18, 26, 20, '2025-03-18T00:00:00.0000000', NULL);
INSERT INTO `TaskBoards` (`TaskBoardId`, `ProjectId`, `TaskId`, `Percentage`, `DueDate`, `TasksTaskId`) VALUES (6, 18, 27, 30, '2025-03-12T00:00:00.0000000', NULL);
INSERT INTO `TaskBoards` (`TaskBoardId`, `ProjectId`, `TaskId`, `Percentage`, `DueDate`, `TasksTaskId`) VALUES (7, 20, 28, 20, '2026-08-26T00:00:00.0000000', NULL);
INSERT INTO `TaskBoards` (`TaskBoardId`, `ProjectId`, `TaskId`, `Percentage`, `DueDate`, `TasksTaskId`) VALUES (8, 20, 28, 100, '2026-09-08T00:00:00.0000000', NULL);
INSERT INTO `Taskmember` (`AssignedId`, `TaskId`, `UserId`) VALUES (1, 18, 37);
INSERT INTO `Taskmember` (`AssignedId`, `TaskId`, `UserId`) VALUES (2, 18, 40);
INSERT INTO `Taskmember` (`AssignedId`, `TaskId`, `UserId`) VALUES (3, 19, 38);
INSERT INTO `Taskmember` (`AssignedId`, `TaskId`, `UserId`) VALUES (4, 20, 37);
INSERT INTO `Taskmember` (`AssignedId`, `TaskId`, `UserId`) VALUES (5, 22, 38);
INSERT INTO `Taskmember` (`AssignedId`, `TaskId`, `UserId`) VALUES (6, 23, 37);
INSERT INTO `Taskmember` (`AssignedId`, `TaskId`, `UserId`) VALUES (7, 24, 38);
INSERT INTO `Taskmember` (`AssignedId`, `TaskId`, `UserId`) VALUES (8, 25, 35);
INSERT INTO `Taskmember` (`AssignedId`, `TaskId`, `UserId`) VALUES (9, 26, 42);
INSERT INTO `Taskmember` (`AssignedId`, `TaskId`, `UserId`) VALUES (10, 27, 42);
INSERT INTO `Taskmember` (`AssignedId`, `TaskId`, `UserId`) VALUES (11, 28, 42);
INSERT INTO `Termination` (`TerminationId`, `UserID`, `TerminationType`, `NoticeDate`, `ResignDate`, `Reason`) VALUES (3, 35, 'Lack of Skills', '2025-02-19T00:00:00.0000000', '2025-02-14T00:00:00.0000000', 'nill');
INSERT INTO `Termination` (`TerminationId`, `UserID`, `TerminationType`, `NoticeDate`, `ResignDate`, `Reason`) VALUES (4, 1, 'Retirement', '2025-02-15T00:00:00.0000000', '2025-02-22T00:00:00.0000000', 'nill');
INSERT INTO `Termination` (`TerminationId`, `UserID`, `TerminationType`, `NoticeDate`, `ResignDate`, `Reason`) VALUES (6, 36, 'Insubordination', '2025-02-21T00:00:00.0000000', '2025-02-26T00:00:00.0000000', 'nill');
INSERT INTO `Termination` (`TerminationId`, `UserID`, `TerminationType`, `NoticeDate`, `ResignDate`, `Reason`) VALUES (9, 42, 'Insubordination', '2025-03-06T00:00:00.0000000', '2025-03-14T00:00:00.0000000', 'Nill');
INSERT INTO `Termination` (`TerminationId`, `UserID`, `TerminationType`, `NoticeDate`, `ResignDate`, `Reason`) VALUES (10, 42, 'Lack of Skills', '2026-08-27T00:00:00.0000000', '2026-08-28T00:00:00.0000000', 'Nothing');
INSERT INTO `Termination` (`TerminationId`, `UserID`, `TerminationType`, `NoticeDate`, `ResignDate`, `Reason`) VALUES (11, 37, 'Retirement', '2026-09-11T00:00:00.0000000', '2026-09-30T00:00:00.0000000', 'None of these');
INSERT INTO `TicketReplies` (`ReplyId`, `TicketId`, `ReplyMessage`, `RepliedBy`, `RepliedAt`) VALUES (1, 3, 'working on it', 'admin', '2025-02-19T10:14:04.9555985');
INSERT INTO `Tickets` (`TicketId`, `TicketTitle`, `EventCategory`, `Subject`, `AssignedBy`, `AssignedTo`, `TicketDescription`, `Priority`, `Status`, `Visibility`, `CreatedAt`) VALUES (3, 'Testing', 'Test', 'Test', 1, 35, 'nill', 'Medium', 'In Progress', 'Public', '2025-02-17T16:21:51.3030506');
INSERT INTO `Timesheets` (`TimesheetId`, `UserId`, `Date`, `WorkHours`, `Status`, `CreatedBy`, `CreatedAt`, `ApprovedBy`, `ApprovedAt`, `ProjectId`) VALUES (12, 37, '2025-02-28T00:00:00.0000000', 3, 'Rejected', 'ram@gmail.com', '2025-02-28T15:25:42.2390886', 'Krish Kheloji', '2025-03-01T16:19:19.7864641', 15);
INSERT INTO `Timesheets` (`TimesheetId`, `UserId`, `Date`, `WorkHours`, `Status`, `CreatedBy`, `CreatedAt`, `ApprovedBy`, `ApprovedAt`, `ProjectId`) VALUES (13, 37, '2025-02-14T00:00:00.0000000', 6, 'Rejected', 'ram@gmail.com', '2025-02-28T15:45:39.3665660', 'Krish Kheloji', '2025-03-01T16:19:19.8106212', 16);
INSERT INTO `Timesheets` (`TimesheetId`, `UserId`, `Date`, `WorkHours`, `Status`, `CreatedBy`, `CreatedAt`, `ApprovedBy`, `ApprovedAt`, `ProjectId`) VALUES (14, 37, '2025-03-01T00:00:00.0000000', 5, 'Approved', 'ram@gmail.com', '2025-03-01T10:22:17.8973652', 'Krish Kheloji', '2025-03-01T16:19:49.0240914', 15);
INSERT INTO `Timesheets` (`TimesheetId`, `UserId`, `Date`, `WorkHours`, `Status`, `CreatedBy`, `CreatedAt`, `ApprovedBy`, `ApprovedAt`, `ProjectId`) VALUES (15, 42, '2025-03-01T00:00:00.0000000', 4, 'Approved', 'nitesh@gmail.com', '2025-03-02T12:06:56.3971790', 'Krish Kheloji', '2025-03-02T17:38:23.8067280', 18);
INSERT INTO `Timesheets` (`TimesheetId`, `UserId`, `Date`, `WorkHours`, `Status`, `CreatedBy`, `CreatedAt`, `ApprovedBy`, `ApprovedAt`, `ProjectId`) VALUES (16, 42, '2025-03-05T00:00:00.0000000', 5, 'Approved', 'nitesh@gmail.com', '2025-03-04T04:55:58.6483279', 'Krish Kheloji', '2025-03-04T10:27:45.8596843', 16);
INSERT INTO `Timesheets` (`TimesheetId`, `UserId`, `Date`, `WorkHours`, `Status`, `CreatedBy`, `CreatedAt`, `ApprovedBy`, `ApprovedAt`, `ProjectId`) VALUES (17, 42, '2025-03-06T00:00:00.0000000', 5, 'Approved', 'nitesh@gmail.com', '2025-03-04T04:56:12.1606845', 'Krish Kheloji', '2025-03-04T10:27:45.8689426', 16);
INSERT INTO `Timesheets` (`TimesheetId`, `UserId`, `Date`, `WorkHours`, `Status`, `CreatedBy`, `CreatedAt`, `ApprovedBy`, `ApprovedAt`, `ProjectId`) VALUES (18, 42, '2026-08-23T00:00:00.0000000', 5, 'Approved', 'nitesh@gmail.com', '2026-08-24T08:54:44.3470328', 'Krish Kheloji', '2026-08-24T14:26:12.9915498', 20);
INSERT INTO `Timesheets` (`TimesheetId`, `UserId`, `Date`, `WorkHours`, `Status`, `CreatedBy`, `CreatedAt`, `ApprovedBy`, `ApprovedAt`, `ProjectId`) VALUES (19, 37, '2026-09-04T00:00:00.0000000', 5, 'Approved', 'ram@gmail.com', '2026-09-05T04:43:04.2519042', 'Krish Kheloji', '2026-09-05T10:14:03.3878471', 21);
INSERT INTO `Timesheets` (`TimesheetId`, `UserId`, `Date`, `WorkHours`, `Status`, `CreatedBy`, `CreatedAt`, `ApprovedBy`, `ApprovedAt`, `ProjectId`) VALUES (20, 42, '2026-09-04T00:00:00.0000000', 10, 'Approved', 'nitesh@gmail.com', '2026-09-05T09:55:00.8973173', 'Krish Kheloji', '2026-09-05T15:25:42.8222853', 20);
INSERT INTO `Trainer` (`TrainerId`, `FirstName`, `LastName`, `Role`, `Email`, `Description`, `Status`, `Phone`, `ProfilePicture`) VALUES (4, 'Rohan', 'R', 'Employee', 'rohan@gmail.com', 'nill', 'Active', 1122334455, '510e8f86-c443-446f-adff-d0f66892b2ec.jpeg');
INSERT INTO `Trainer` (`TrainerId`, `FirstName`, `LastName`, `Role`, `Email`, `Description`, `Status`, `Phone`, `ProfilePicture`) VALUES (7, 'Jay', 'J', 'Employee', 'jay@gmail.com', 'not added', 'Active', 1233444455, '17a2ad8d-b45c-42d2-8ec2-9bfc959484e8.png');
INSERT INTO `Training` (`TrainingId`, `TrainerId`, `TrainingTypeId`, `UserId`, `TrainingCost`, `Description`, `Status`, `StartDate`, `EndDate`, `CreatedAt`, `CreatedBy`, `ModifiedBy`, `ModifiedAt`) VALUES (9, 4, 4, 37, 100.00, 'nill', 'Active', '2025-02-15T00:00:00.0000000', '2025-02-22T00:00:00.0000000', '2025-02-22T15:00:25.487', 'admin@gmail.com', 'admin@gmail.com', '2025-02-22T15:05:20.880');
INSERT INTO `Training` (`TrainingId`, `TrainerId`, `TrainingTypeId`, `UserId`, `TrainingCost`, `Description`, `Status`, `StartDate`, `EndDate`, `CreatedAt`, `CreatedBy`, `ModifiedBy`, `ModifiedAt`) VALUES (10, 7, 9, 42, 100.00, 'Nill about ', 'Active', '2025-03-07T00:00:00.0000000', '2025-03-28T00:00:00.0000000', '2025-03-01T18:48:04.053', 'admin@gmail.com', 'admin@gmail.com', '2025-03-03T17:18:56.403');
INSERT INTO `TrainingType` (`TrainingTypeId`, `TrainingTypeName`, `Description`, `Status`) VALUES (4, 'KT', 'Knowledge Transfer', 'Active');
INSERT INTO `TrainingType` (`TrainingTypeId`, `TrainingTypeName`, `Description`, `Status`) VALUES (5, 'Train', 'Something Train', 'Active');
INSERT INTO `TrainingType` (`TrainingTypeId`, `TrainingTypeName`, `Description`, `Status`) VALUES (6, 'Session', 'session describe', 'Inactive');
INSERT INTO `TrainingType` (`TrainingTypeId`, `TrainingTypeName`, `Description`, `Status`) VALUES (9, 'Listening', 'Nill', 'Active');
INSERT INTO `User` (`UserId`, `FirstName`, `LastName`, `Email`, `PasswordHash`, `PhoneNumber`, `RoleId`, `DepartmentId`, `DesignationtId`, `DateOfJoining`, `DateOfBirth`, `Gender`, `Address`, `AboutEmployee`, `ProfilePicture`, `RoleId1`, `ReportingManager`, `CreatedAt`, `CreatedBy`, `ModifiedBy`, `ModifiedAt`, `Status`) VALUES (1, 'admin', 'a', 'admin@gmail.com', '123', '1222222222', 3, NULL, 12, '2025-02-11T00:00:00.0000000', '2025-02-11T00:00:00.0000000', 'Male', 'Mumbai', '																																																																																																																																															I am Software developer 
												
				
												
												
												
												
												
												
												
												
												
												', 'Content/uploads/profile pic.png', NULL, NULL, NULL, NULL, NULL, NULL, 'Active');
INSERT INTO `User` (`UserId`, `FirstName`, `LastName`, `Email`, `PasswordHash`, `PhoneNumber`, `RoleId`, `DepartmentId`, `DesignationtId`, `DateOfJoining`, `DateOfBirth`, `Gender`, `Address`, `AboutEmployee`, `ProfilePicture`, `RoleId1`, `ReportingManager`, `CreatedAt`, `CreatedBy`, `ModifiedBy`, `ModifiedAt`, `Status`) VALUES (35, 'Krish', 'Kheloji', 'khelojikrish@gmail.com', '123', '8877665544', 8, 25, 12, '2025-05-02T00:00:00.0000000', '2025-05-02T00:00:00.0000000', 'Male', 'Chicago', 'nill', 'Content/uploads/Krish Photo.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, 'Active');
INSERT INTO `User` (`UserId`, `FirstName`, `LastName`, `Email`, `PasswordHash`, `PhoneNumber`, `RoleId`, `DepartmentId`, `DesignationtId`, `DateOfJoining`, `DateOfBirth`, `Gender`, `Address`, `AboutEmployee`, `ProfilePicture`, `RoleId1`, `ReportingManager`, `CreatedAt`, `CreatedBy`, `ModifiedBy`, `ModifiedAt`, `Status`) VALUES (36, 'SurajR', 'K', 'suraj@gmail.com', '123', '6546378292', 10, 25, 12, '0001-01-01T00:00:00.0000000', '0001-01-01T00:00:00.0000000', 'Male', 'delhi', 'nill', 'Content/uploads/user1.jpg', NULL, 'Krish', '2025-02-19T06:47:46.540', 'admin', 'admin', '2025-02-24T05:14:29.550', 'Active');
INSERT INTO `User` (`UserId`, `FirstName`, `LastName`, `Email`, `PasswordHash`, `PhoneNumber`, `RoleId`, `DepartmentId`, `DesignationtId`, `DateOfJoining`, `DateOfBirth`, `Gender`, `Address`, `AboutEmployee`, `ProfilePicture`, `RoleId1`, `ReportingManager`, `CreatedAt`, `CreatedBy`, `ModifiedBy`, `ModifiedAt`, `Status`) VALUES (37, 'Ram', 'Kheloji', 'ram@gmail.com', '123', '8877665544', 10, 25, 12, '0001-01-01T00:00:00.0000000', '0001-01-01T00:00:00.0000000', 'Male', 'Mumbai', '																																							nill
												
												
												', 'Content/uploads/user2.jpg', NULL, 'Krish', '2025-02-19T19:43:57.600', 'admin', 'admin', '2025-02-22T08:45:09.050', 'Active');
INSERT INTO `User` (`UserId`, `FirstName`, `LastName`, `Email`, `PasswordHash`, `PhoneNumber`, `RoleId`, `DepartmentId`, `DesignationtId`, `DateOfJoining`, `DateOfBirth`, `Gender`, `Address`, `AboutEmployee`, `ProfilePicture`, `RoleId1`, `ReportingManager`, `CreatedAt`, `CreatedBy`, `ModifiedBy`, `ModifiedAt`, `Status`) VALUES (38, 'Jack', 'J', 'jack@gmail.com', '123', '9988776655', 10, 25, 12, '0001-01-01T00:00:00.0000000', '0001-01-01T00:00:00.0000000', 'Male', 'Chicago', 'nill', 'Content/uploads/IMG_20230714_114721.jpg', NULL, 'Krish', '2025-02-22T06:00:33.777', 'admin', NULL, NULL, 'Active');
INSERT INTO `User` (`UserId`, `FirstName`, `LastName`, `Email`, `PasswordHash`, `PhoneNumber`, `RoleId`, `DepartmentId`, `DesignationtId`, `DateOfJoining`, `DateOfBirth`, `Gender`, `Address`, `AboutEmployee`, `ProfilePicture`, `RoleId1`, `ReportingManager`, `CreatedAt`, `CreatedBy`, `ModifiedBy`, `ModifiedAt`, `Status`) VALUES (40, 'Harish', 'K', 'harish@gmail.com', '123', '9988776655', 10, 25, 12, '2025-02-26T00:00:00.0000000', '2025-02-20T00:00:00.0000000', 'Male', 'delhi', 'not mentioned', 'Content/uploads/photo.jpeg', NULL, 'Krish', '2025-02-24T06:18:50.260', 'admin', 'admin', '2025-03-05T09:15:35.810', 'Active');
INSERT INTO `User` (`UserId`, `FirstName`, `LastName`, `Email`, `PasswordHash`, `PhoneNumber`, `RoleId`, `DepartmentId`, `DesignationtId`, `DateOfJoining`, `DateOfBirth`, `Gender`, `Address`, `AboutEmployee`, `ProfilePicture`, `RoleId1`, `ReportingManager`, `CreatedAt`, `CreatedBy`, `ModifiedBy`, `ModifiedAt`, `Status`) VALUES (42, 'Nitesh', '', 'nitesh@gmail.com', '123', '9988776655', 10, 25, 12, '2025-03-13T00:00:00.0000000', '2025-03-26T00:00:00.0000000', 'Male', 'delhi', 'Nill', 'Content/uploads/stamp.jpg', NULL, 'Krish', '2025-03-01T13:00:04.843', 'admin', 'admin', '2025-03-02T10:25:25.893', 'Active');

-- DEFAULTS
-- Removed: "ALTER TABLE Events ALTER COLUMN Status SET DEFAULT ''" used to be here.
-- Events.Status is a LONGTEXT column, and MySQL does not allow TEXT/BLOB columns
-- to have a DEFAULT value at all, so this line always errored and stopped the
-- whole script from finishing. Every INSERT already sets a Status value anyway,
-- so the default was not needed.
ALTER TABLE `Taskmember` ALTER COLUMN `TaskId` SET DEFAULT (0);
ALTER TABLE `Trainer` ALTER COLUMN `Phone` SET DEFAULT 0;

-- FOREIGN KEYS
ALTER TABLE `Attendance` ADD CONSTRAINT `FK_Attendance_User_UserId` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`);
ALTER TABLE `Deduction` ADD CONSTRAINT `FK_Deduction_DeductionType_DeductionTypeId` FOREIGN KEY (`DeductionTypeId`) REFERENCES `DeductionType` (`DeductionTypeId`);
ALTER TABLE `Deduction` ADD CONSTRAINT `FK_Deduction_Departments_DepartmentId` FOREIGN KEY (`DepartmentId`) REFERENCES `Departments` (`DepartmentId`);
ALTER TABLE `Deduction` ADD CONSTRAINT `FK_Deduction_Designations_DesignationId` FOREIGN KEY (`DesignationId`) REFERENCES `Designations` (`DesignationId`);
ALTER TABLE `DepartmentLeaves` ADD CONSTRAINT `FK_DepartmentLeaves_Departments_DepartmentId` FOREIGN KEY (`DepartmentId`) REFERENCES `Departments` (`DepartmentId`);
ALTER TABLE `DepartmentLeaves` ADD CONSTRAINT `FK_DepartmentLeaves_MasterLeaveTypes_LeaveTypeId` FOREIGN KEY (`LeaveTypeId`) REFERENCES `MasterLeaveTypes` (`LeaveTypeId`);
ALTER TABLE `Designations` ADD CONSTRAINT `FK_Designations_Departments_DepartmentId` FOREIGN KEY (`DepartmentId`) REFERENCES `Departments` (`DepartmentId`);
ALTER TABLE `Earning` ADD CONSTRAINT `FK_Earning_Departments_DepartmentId` FOREIGN KEY (`DepartmentId`) REFERENCES `Departments` (`DepartmentId`);
ALTER TABLE `Earning` ADD CONSTRAINT `FK_Earning_Designations_DesignationId` FOREIGN KEY (`DesignationId`) REFERENCES `Designations` (`DesignationId`);
ALTER TABLE `Earning` ADD CONSTRAINT `FK_Earning_EarningType_EarntypeId` FOREIGN KEY (`EarntypeId`) REFERENCES `EarningType` (`EarntypeId`);
ALTER TABLE `EducationDetails` ADD CONSTRAINT `FK_EducationDetails_User_UserId` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`);
ALTER TABLE `EmployeeBankDetails` ADD CONSTRAINT `FK_EmployeeBankDetails_User_UserId` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`);
ALTER TABLE `EmployeeDeductions` ADD CONSTRAINT `FK_EmployeeDeductions_Deduction_DeductionId` FOREIGN KEY (`DeductionId`) REFERENCES `Deduction` (`DeductionId`);
ALTER TABLE `EmployeeDeductions` ADD CONSTRAINT `FK_EmployeeDeductions_EmployeeSalaries_SalaryId` FOREIGN KEY (`SalaryId`) REFERENCES `EmployeeSalaries` (`SalaryId`);
ALTER TABLE `EmployeeEarnings` ADD CONSTRAINT `FK_EmployeeEarnings_Earning_EarningId` FOREIGN KEY (`EarningId`) REFERENCES `Earning` (`EarningsId`);
ALTER TABLE `EmployeeEarnings` ADD CONSTRAINT `FK_EmployeeEarnings_EmployeeSalaries_SalaryId` FOREIGN KEY (`SalaryId`) REFERENCES `EmployeeSalaries` (`SalaryId`);
ALTER TABLE `EmployeeFamilyDetails` ADD CONSTRAINT `FK_EmployeeFamilyDetails_User_UserId` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`);
ALTER TABLE `EmployeeSalaries` ADD CONSTRAINT `FK_EmployeeSalaries_User_UserId` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`);
ALTER TABLE `Experience` ADD CONSTRAINT `FK_Experience_User_UserId` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`);
ALTER TABLE `FileUploads` ADD CONSTRAINT `FK_FileUploads_User_UserId` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`);
ALTER TABLE `GoalTrackingList` ADD CONSTRAINT `FK_GoalTrackingList_GoalTypeList_GoalId` FOREIGN KEY (`GoalId`) REFERENCES `GoalTypeList` (`GoalId`);
ALTER TABLE `LeaveBalances` ADD CONSTRAINT `FK_LeaveBalances_DepartmentLeaves_DepartmentLeavesId` FOREIGN KEY (`DepartmentLeavesId`) REFERENCES `DepartmentLeaves` (`DepartmentLeavesId`);
ALTER TABLE `LeaveBalances` ADD CONSTRAINT `FK_LeaveBalances_MasterLeaveTypes_LeaveTypeId` FOREIGN KEY (`LeaveTypeId`) REFERENCES `MasterLeaveTypes` (`LeaveTypeId`);
ALTER TABLE `LeaveBalances` ADD CONSTRAINT `FK_LeaveBalances_User_UserId` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`);
ALTER TABLE `LeaveRequests` ADD CONSTRAINT `FK_LeaveRequests_MasterLeaveTypes_LeaveTypeId` FOREIGN KEY (`LeaveTypeId`) REFERENCES `MasterLeaveTypes` (`LeaveTypeId`);
ALTER TABLE `LeaveRequests` ADD CONSTRAINT `FK_LeaveRequests_User_UserId` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`);
ALTER TABLE `Payslips` ADD CONSTRAINT `FK_Payslips_User_UserId` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`);
ALTER TABLE `PerformanceAppriasal` ADD CONSTRAINT `FK_PerformanceAppriasal_Departments_DepartmentId` FOREIGN KEY (`DepartmentId`) REFERENCES `Departments` (`DepartmentId`);
ALTER TABLE `PerformanceAppriasal` ADD CONSTRAINT `FK_PerformanceAppriasal_Designations_DesignationId` FOREIGN KEY (`DesignationId`) REFERENCES `Designations` (`DesignationId`);
ALTER TABLE `PerformanceAppriasal` ADD CONSTRAINT `FK_PerformanceAppriasal_User_UserId` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`);
ALTER TABLE `PerformanceIndicators` ADD CONSTRAINT `FK_PerformanceIndicators_Departments_DepartmentId` FOREIGN KEY (`DepartmentId`) REFERENCES `Departments` (`DepartmentId`);
ALTER TABLE `PerformanceIndicators` ADD CONSTRAINT `FK_PerformanceIndicators_Designations_DesignationId` FOREIGN KEY (`DesignationId`) REFERENCES `Designations` (`DesignationId`);
ALTER TABLE `ProjectsUser` ADD CONSTRAINT `FK_ProjectsUser_AllProjects_ProjectsProjectId` FOREIGN KEY (`ProjectsProjectId`) REFERENCES `AllProjects` (`ProjectId`);
ALTER TABLE `ProjectsUser` ADD CONSTRAINT `FK_ProjectsUser_User_UsersUserId` FOREIGN KEY (`UsersUserId`) REFERENCES `User` (`UserId`);
ALTER TABLE `Promotion` ADD CONSTRAINT `FK_Promotion_User_UserID` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserId`);
ALTER TABLE `Resignation` ADD CONSTRAINT `FK_Resignation_Departments_DepartmentId` FOREIGN KEY (`DepartmentId`) REFERENCES `Departments` (`DepartmentId`);
ALTER TABLE `Resignation` ADD CONSTRAINT `FK_Resignation_User_UserID` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserId`);
ALTER TABLE `subTopics` ADD CONSTRAINT `FK_subTopics_KnowledgeBaseTopics_KnowledgeBaseTopicId` FOREIGN KEY (`KnowledgeBaseTopicId`) REFERENCES `KnowledgeBaseTopics` (`Id`);
ALTER TABLE `Task` ADD CONSTRAINT `FK_Task_AllProjects_ProjectId` FOREIGN KEY (`ProjectId`) REFERENCES `AllProjects` (`ProjectId`);
ALTER TABLE `TaskBoards` ADD CONSTRAINT `FK_TaskBoards_AllProjects_ProjectId` FOREIGN KEY (`ProjectId`) REFERENCES `AllProjects` (`ProjectId`);
ALTER TABLE `TaskBoards` ADD CONSTRAINT `FK_TaskBoards_Task_TaskId` FOREIGN KEY (`TaskId`) REFERENCES `Task` (`TaskId`);
ALTER TABLE `TaskBoards` ADD CONSTRAINT `FK_TaskBoards_Task_TasksTaskId` FOREIGN KEY (`TasksTaskId`) REFERENCES `Task` (`TaskId`);
ALTER TABLE `Taskmember` ADD CONSTRAINT `FK_Taskmember_Task_TaskId` FOREIGN KEY (`TaskId`) REFERENCES `Task` (`TaskId`);
ALTER TABLE `Taskmember` ADD CONSTRAINT `FK_Taskmember_User_UserId` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`);
ALTER TABLE `Termination` ADD CONSTRAINT `FK_Termination_User_UserID` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserId`);
ALTER TABLE `TicketReplies` ADD CONSTRAINT `FK_TicketReplies_Tickets_TicketId` FOREIGN KEY (`TicketId`) REFERENCES `Tickets` (`TicketId`);
ALTER TABLE `Tickets` ADD CONSTRAINT `FK_Tickets_User_AssignedBy` FOREIGN KEY (`AssignedBy`) REFERENCES `User` (`UserId`);
ALTER TABLE `Tickets` ADD CONSTRAINT `FK_Tickets_User_AssignedTo` FOREIGN KEY (`AssignedTo`) REFERENCES `User` (`UserId`);
ALTER TABLE `Timesheets` ADD CONSTRAINT `FK_Timesheets_AllProjects_ProjectId` FOREIGN KEY (`ProjectId`) REFERENCES `AllProjects` (`ProjectId`);
ALTER TABLE `Timesheets` ADD CONSTRAINT `FK_Timesheets_User_UserId` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`);
ALTER TABLE `Training` ADD CONSTRAINT `FK_Training_Trainer_TrainerId` FOREIGN KEY (`TrainerId`) REFERENCES `Trainer` (`TrainerId`);
ALTER TABLE `Training` ADD CONSTRAINT `FK_Training_TrainingType_TrainingTypeId` FOREIGN KEY (`TrainingTypeId`) REFERENCES `TrainingType` (`TrainingTypeId`);
ALTER TABLE `Training` ADD CONSTRAINT `FK_Training_User_UserId` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`);
ALTER TABLE `User` ADD CONSTRAINT `FK_User_Departments_DepartmentId` FOREIGN KEY (`DepartmentId`) REFERENCES `Departments` (`DepartmentId`);
ALTER TABLE `User` ADD CONSTRAINT `FK_User_Designations_DesignationtId` FOREIGN KEY (`DesignationtId`) REFERENCES `Designations` (`DesignationId`);
ALTER TABLE `User` ADD CONSTRAINT `FK_User_Role_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `Role` (`RoleId`);
ALTER TABLE `User` ADD CONSTRAINT `FK_User_Role_RoleId1` FOREIGN KEY (`RoleId1`) REFERENCES `Role` (`RoleId`);

SET FOREIGN_KEY_CHECKS=1;


-- Removed: a few leftover manual-testing commands used to be here
-- ("show tables;", "select * from user;", "select * from Departments;",
-- "select * from designations;", "desc user;"). They were just someone
-- checking things by hand, not part of setting up the database, and
-- "select * from user" even errored on its own (table is really named
-- "User" with a capital U, and table names are case-sensitive here),
-- which stopped the rest of this file from running.


INSERT INTO `User`(
    `FirstName`,
    `LastName`,
    `Email`,
    `PasswordHash`,
    `PhoneNumber`,
    `RoleId`,
    `DepartmentId`,
    `DesignationtId`,
    `DateOfJoining`,
    `DateOfBirth`,
    `Gender`,
    `Address`,
    `AboutEmployee`,
    `ProfilePicture`,
    `RoleId1`,
    `ReportingManager`,
    `CreatedAt`,
    `CreatedBy`,
    `ModifiedBy`,
    `ModifiedAt`,
    `Status`
)
VALUES

-- =========================
-- ADMIN - RoleId 3
-- =========================

(  'Rajesh',
    'Sharma',
    'rajesh.sharma@example.com',
    '138b40fd6c295cb883fe9e9162cac0d8f4e6a4b1f619045d47bdbc361c15acf4',
    '9876500001',
    3,
    25,
    12,
    '2022-01-10 09:00:00',
    '1985-04-15 00:00:00',
    'Male',
    'Nashik, Maharashtra',
    'System administrator responsible for managing the organization and users.',
    'default-profile.jpg',
    NULL,
    NULL,
    NOW(),
    'system',
    NULL,
    NULL,
    'Active'
),

(    'Anita',
    'Patil',
    'anita.patil@example.com',
    '138b40fd6c295cb883fe9e9162cac0d8f4e6a4b1f619045d47bdbc361c15acf4',
    '9876500002',
    3,
    25,
    12,
    '2022-03-15 09:00:00',
    '1988-07-22 00:00:00',
    'Female',
    'Pune, Maharashtra',
    'Administrator responsible for employee management and system operations.',
    'default-profile.jpg',
    NULL,
    NULL,
    NOW(),
    'system',
    NULL,
    NULL,
    'Active'
),

-- =========================
-- MANAGER - RoleId 8
-- =========================

(
    'Amit',
    'Deshmukh',
    'amit.deshmukh@example.com',
    'da1e1ba8da7a301f5039d51fb12695e3f874de89c8116203b6a37e776851b45a',
    '9876500003',
    8,
    25,
    12,
    '2023-02-01 09:00:00',
    '1990-09-12 00:00:00',
    'Male',
    'Mumbai, Maharashtra',
    'Department manager responsible for team performance and project delivery.',
    'default-profile.jpg',
    8,
    'Rajesh Sharma',
    NOW(),
    'admin',
    NULL,
    NULL,
    'Active'
),

(
    'Priya',
    'Kulkarni',
    'priya.kulkarni@example.com',
    'da1e1ba8da7a301f5039d51fb12695e3f874de89c8116203b6a37e776851b45a',
    '9876500004',
    8,
   25,
    12,
    '2023-04-10 09:00:00',
    '1992-02-28 00:00:00',
    'Female',
    'Nashik, Maharashtra',
    'Experienced manager focused on team development and business operations.',
    'default-profile.jpg',
    8,
    'Anita Patil',
    NOW(),
    'admin',
    NULL,
    NULL,
    'Active'
),

-- =========================
-- EMPLOYEE - RoleId 10
-- =========================

(
    'Vikas',
    'Jadhav',
    'vikas.jadhav@example.com',
    'f59dbd5831cd7796fc2bb037967cb32bbcdc7bd1805d055936559975fe6c8d6e',
    '9876500005',
    10,
   25,
    12,
    '2024-01-15 09:00:00',
    '1997-06-18 00:00:00',
    'Male',
    'Nashik, Maharashtra',
    'Software employee working on application development and maintenance.',
    'default-profile.jpg',
    10,
    'Amit Deshmukh',
    NOW(),
    'admin',
    NULL,
    NULL,
    'Active'
),

(
    'Sneha',
    'Joshi',
    'sneha.joshi@example.com',
    'f59dbd5831cd7796fc2bb037967cb32bbcdc7bd1805d055936559975fe6c8d6e',
    '9876500006',
    10,
    25,
    12,
    '2024-03-20 09:00:00',
    '1998-11-05 00:00:00',
    'Female',
    'Pune, Maharashtra',
    'Dedicated employee working on business operations and team projects.',
    'default-profile.jpg',
    10,
    'Priya Kulkarni',
    NOW(),
    'admin',
    NULL,
    NULL,
    'Active'
);



INSERT INTO `User`(
    `FirstName`,
    `LastName`,
    `Email`,
    `PasswordHash`,
    `PhoneNumber`,
    `RoleId`,
    `DepartmentId`,
    `DesignationtId`,
    `DateOfJoining`,
    `DateOfBirth`,
    `Gender`,
    `Address`,
    `AboutEmployee`,
    `ProfilePicture`,
    `RoleId1`,
    `ReportingManager`,
    `CreatedAt`,
    `CreatedBy`,
    `ModifiedBy`,
    `ModifiedAt`,
    `Status`
)
VALUES

-- =========================
-- ADMIN - RoleId 3
-- =========================

(  'Shreya',
    'Pandey',
    'spprac82@gmail.com',
    'f59dbd5831cd7796fc2bb037967cb32bbcdc7bd1805d055936559975fe6c8d6e',
    '9876500001',
    3,
    25,
    12,
    '2022-01-10 09:00:00',
    '1985-04-15 00:00:00',
    'Male',
    'Nashik, Maharashtra',
    'System administrator responsible for managing the organization and users.',
    'default-profile.jpg',
    12,
    25,
    NOW(),
    'system',
    NULL,
    NULL,
    'Active'
);




show tables;

desc user;
select  * from user;
select  * from role;
desc designations;

select  * from EmployeeFamilyDetails;
select  * from EmployeeBankDetails;
select  * from  EducationDetails;


select  * from departments;


select version();

ALTER TABLE `designations`
CHANGE COLUMN `DesignationtId` `DesignationId` INT NULL;
desc user;

