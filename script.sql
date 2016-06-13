USE [studentdb]
GO
/****** Object:  Table [dbo].[pop_options]    Script Date: 06/09/2016 18:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pop_options](
	[user_type_id] [int] IDENTITY(1,1) NOT NULL,
	[options] [nvarchar](50) NULL,
 CONSTRAINT [PK_pop_options] PRIMARY KEY CLUSTERED 
(
	[user_type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_program_name]    Script Date: 06/09/2016 18:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_program_name](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[options] [nvarchar](500) NULL,
	[is_active] [tinyint] NULL,
	[created_on] [timestamp] NULL,
 CONSTRAINT [PK_tbl_program_name] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_admin_login]    Script Date: 06/09/2016 18:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_admin_login](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_admin_login] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SaveProgramName]    Script Date: 06/09/2016 18:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SaveProgramName]
	-- Add the parameters for the stored procedure here
	@options nvarchar(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	insert into tbl_program_name (options) values (@options)
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserType]    Script Date: 06/09/2016 18:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserType] 
AS
BEGIN
	Select * from pop_options
END
GO
/****** Object:  Table [dbo].[user_info]    Script Date: 06/09/2016 18:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_info](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[user_type_id] [int] NULL,
	[firstname] [varchar](50) NULL,
	[lastname] [varchar](50) NULL,
	[address] [nvarchar](200) NULL,
	[phoneno] [varchar](50) NULL,
	[is_active] [tinyint] NULL,
	[is_assigned] [tinyint] NULL,
	[created_on] [timestamp] NULL,
 CONSTRAINT [PK_user_info] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_user_info] UNIQUE NONCLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ_PhoneNo] UNIQUE NONCLUSTERED 
(
	[phoneno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetAdminLogin]    Script Date: 06/09/2016 18:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAdminLogin]
	-- Add the parameters for the stored procedure here
	@username nvarchar(50)
AS
BEGIN
	select username,password from tbl_admin_login where  username=@username
END
GO
/****** Object:  Table [dbo].[user_login]    Script Date: 06/09/2016 18:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_login](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[emailid] [nvarchar](50) NULL,
	[created_on] [timestamp] NULL,
 CONSTRAINT [PK_user_login] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_Email] UNIQUE NONCLUSTERED 
(
	[emailid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_UserName] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[updateUserInfo]    Script Date: 06/09/2016 18:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updateUserInfo] 
	-- Add the parameters for the stored procedure here
	(@userid int,
	@isactive int
	)
AS
BEGIN
	update user_info set is_active = @isactive where userid = @userid
END
GO
/****** Object:  Table [dbo].[team_project]    Script Date: 06/09/2016 18:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[team_project](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[generated_userid] [int] NULL,
	[projectname] [nvarchar](500) NULL,
	[projectno] [nvarchar](50) NULL,
	[projecttype] [nvarchar](50) NULL,
	[teamname] [nvarchar](500) NULL,
	[startdate] [datetime] NULL,
	[enddate] [datetime] NULL,
	[is_active] [tinyint] NULL,
	[created_on] [timestamp] NULL,
 CONSTRAINT [PK_team_project] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[non_student_info]    Script Date: 06/09/2016 18:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[non_student_info](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[designation] [nvarchar](500) NULL,
	[department] [nvarchar](500) NULL,
	[programname] [nvarchar](500) NULL,
	[userid] [int] NULL,
	[created_on] [timestamp] NULL,
 CONSTRAINT [PK_non_student_info] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[getUserID]    Script Date: 06/09/2016 18:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getUserID] 
	@phoneno varchar(50)
AS
BEGIN
	Select user_info.userid from user_info where user_info.phoneno = @phoneno
END
GO
/****** Object:  StoredProcedure [dbo].[GetParticularsUserJoin]    Script Date: 06/09/2016 18:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetParticularsUserJoin] 
	-- Add the parameters for the stored procedure here
	@user_type_id INT
AS
BEGIN
    SELECT pop_options.options, user_info.firstname, user_info.lastname, user_info.address, user_info.phoneno, user_info.is_active
	FROM pop_options INNER JOIN
    user_info ON pop_options.user_type_id = user_info.user_type_id
    Where pop_options.user_type_id = @user_type_id
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsersJoin]    Script Date: 06/09/2016 18:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllUsersJoin]
	
AS
BEGIN

    -- Insert statements for procedure here
	SELECT ui.userid,   po.options, ui.firstname, ui.lastname, ui.address, ui.phoneno, ui.is_active
	FROM
	pop_options po  INNER JOIN
    user_info ui ON po.user_type_id = ui.user_type_id
END
GO
/****** Object:  StoredProcedure [dbo].[SaveUserInfo]    Script Date: 06/09/2016 18:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SaveUserInfo]
	-- Add the parameters for the stored procedure here
	@user_type_id int,
	@firstname varchar(50),
	@lastname varchar(50),
	@address nvarchar(200),
	@phoneno varchar(50)
AS
BEGIN
	Insert into user_info (user_type_id,firstname,lastname,address,phoneno) values(@user_type_id,@firstname,@lastname,@address,@phoneno)
END
GO
/****** Object:  Table [dbo].[student_info]    Script Date: 06/09/2016 18:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_info](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rollno] [nvarchar](50) NULL,
	[coursename] [nvarchar](500) NULL,
	[semester] [nvarchar](50) NULL,
	[userid] [int] NULL,
	[created_on] [timestamp] NULL,
 CONSTRAINT [PK_student_info] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SaveUserLogin]    Script Date: 06/09/2016 18:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SaveUserLogin] 
	-- Add the parameters for the stored procedure here
	@userid int,
	@username nvarchar(50),
	@password nvarchar(50),
	@emailid nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Insert into user_login (userid,username,password,emailid) values(@userid,@username,@password,@emailid)
END
GO
/****** Object:  StoredProcedure [dbo].[SaveStudentInfo]    Script Date: 06/09/2016 18:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SaveStudentInfo] 
	@rollno nvarchar(50),
	@coursename nvarchar(50),
	@semester nvarchar(50),
	@userid INT
AS
BEGIN
	Insert into student_info (rollno,coursename,semester,userid) values(@rollno,@coursename,@semester,@userid)
END
GO
/****** Object:  StoredProcedure [dbo].[SaveNonStudentInfo]    Script Date: 06/09/2016 18:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SaveNonStudentInfo] 
	@designation nvarchar(50),
	@department nvarchar(50),
	@programname nvarchar(50),
	@userid INT
AS
BEGIN
	Insert into non_student_info(designation,department,programname,userid) values(@designation,@department,@programname,@userid)
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserLogin]    Script Date: 06/09/2016 18:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserLogin]
	@username nvarchar(50)
AS
BEGIN
	-- Insert statements for procedure here
	SELECT username,password from user_login where username = @username
END
GO
/****** Object:  Table [dbo].[team_members]    Script Date: 06/09/2016 18:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[team_members](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[projectid] [int] NULL,
	[userid] [int] NULL,
	[user_role] [nvarchar](50) NULL,
	[is_assigned] [tinyint] NULL,
 CONSTRAINT [PK_team_members] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[team_budget_record]    Script Date: 06/09/2016 18:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[team_budget_record](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[budgetdate] [datetime] NULL,
	[budget_ac_no] [nvarchar](50) NULL,
	[team_id] [int] NOT NULL,
	[sponsor_user_id] [int] NULL,
	[from_project_account] [nvarchar](50) NULL,
	[other_applied_projects] [nvarchar](50) NULL,
	[oce_apporved_project] [tinyint] NULL,
	[directparts] [text] NULL,
	[previoustotal] [numeric](10, 2) NULL,
	[newtotal] [numeric](10, 2) NULL,
	[cash_recovery] [nvarchar](50) NULL,
	[vendor_info] [text] NULL,
	[is_budget_approved] [tinyint] NULL,
	[created_on] [timestamp] NULL,
 CONSTRAINT [PK_team_budget_record] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[team_budget_records_items]    Script Date: 06/09/2016 18:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[team_budget_records_items](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[budget_id] [int] NULL,
	[quantity] [int] NULL,
	[description] [text] NULL,
	[unitprice] [numeric](10, 2) NULL,
	[item_total_price] [numeric](10, 2) NULL,
	[created_on] [timestamp] NULL,
 CONSTRAINT [PK_team_budget_records_items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Default [DF_user_info_is_active]    Script Date: 06/09/2016 18:05:42 ******/
ALTER TABLE [dbo].[user_info] ADD  CONSTRAINT [DF_user_info_is_active]  DEFAULT ((0)) FOR [is_active]
GO
/****** Object:  Default [DF_user_info_is_assigned]    Script Date: 06/09/2016 18:05:42 ******/
ALTER TABLE [dbo].[user_info] ADD  CONSTRAINT [DF_user_info_is_assigned]  DEFAULT ((0)) FOR [is_assigned]
GO
/****** Object:  ForeignKey [FK_non_student_info_user_info]    Script Date: 06/09/2016 18:05:42 ******/
ALTER TABLE [dbo].[non_student_info]  WITH CHECK ADD  CONSTRAINT [FK_non_student_info_user_info] FOREIGN KEY([userid])
REFERENCES [dbo].[user_info] ([userid])
GO
ALTER TABLE [dbo].[non_student_info] CHECK CONSTRAINT [FK_non_student_info_user_info]
GO
/****** Object:  ForeignKey [FK_pop_options_pop_options]    Script Date: 06/09/2016 18:05:42 ******/
ALTER TABLE [dbo].[pop_options]  WITH CHECK ADD  CONSTRAINT [FK_pop_options_pop_options] FOREIGN KEY([user_type_id])
REFERENCES [dbo].[pop_options] ([user_type_id])
GO
ALTER TABLE [dbo].[pop_options] CHECK CONSTRAINT [FK_pop_options_pop_options]
GO
/****** Object:  ForeignKey [FK_student_info_user_info]    Script Date: 06/09/2016 18:05:42 ******/
ALTER TABLE [dbo].[student_info]  WITH CHECK ADD  CONSTRAINT [FK_student_info_user_info] FOREIGN KEY([userid])
REFERENCES [dbo].[user_info] ([userid])
GO
ALTER TABLE [dbo].[student_info] CHECK CONSTRAINT [FK_student_info_user_info]
GO
/****** Object:  ForeignKey [FK_team_budget_record_team_members]    Script Date: 06/09/2016 18:05:42 ******/
ALTER TABLE [dbo].[team_budget_record]  WITH CHECK ADD  CONSTRAINT [FK_team_budget_record_team_members] FOREIGN KEY([team_id])
REFERENCES [dbo].[team_members] ([id])
GO
ALTER TABLE [dbo].[team_budget_record] CHECK CONSTRAINT [FK_team_budget_record_team_members]
GO
/****** Object:  ForeignKey [FK_team_budget_record_user_info]    Script Date: 06/09/2016 18:05:42 ******/
ALTER TABLE [dbo].[team_budget_record]  WITH CHECK ADD  CONSTRAINT [FK_team_budget_record_user_info] FOREIGN KEY([sponsor_user_id])
REFERENCES [dbo].[user_info] ([userid])
GO
ALTER TABLE [dbo].[team_budget_record] CHECK CONSTRAINT [FK_team_budget_record_user_info]
GO
/****** Object:  ForeignKey [FK_team_budget_records_items_team_budget_record]    Script Date: 06/09/2016 18:05:42 ******/
ALTER TABLE [dbo].[team_budget_records_items]  WITH CHECK ADD  CONSTRAINT [FK_team_budget_records_items_team_budget_record] FOREIGN KEY([budget_id])
REFERENCES [dbo].[team_budget_record] ([id])
GO
ALTER TABLE [dbo].[team_budget_records_items] CHECK CONSTRAINT [FK_team_budget_records_items_team_budget_record]
GO
/****** Object:  ForeignKey [FK_team_members_team_project]    Script Date: 06/09/2016 18:05:42 ******/
ALTER TABLE [dbo].[team_members]  WITH CHECK ADD  CONSTRAINT [FK_team_members_team_project] FOREIGN KEY([projectid])
REFERENCES [dbo].[team_project] ([id])
GO
ALTER TABLE [dbo].[team_members] CHECK CONSTRAINT [FK_team_members_team_project]
GO
/****** Object:  ForeignKey [FK_team_members_user_info]    Script Date: 06/09/2016 18:05:42 ******/
ALTER TABLE [dbo].[team_members]  WITH CHECK ADD  CONSTRAINT [FK_team_members_user_info] FOREIGN KEY([userid])
REFERENCES [dbo].[user_info] ([userid])
GO
ALTER TABLE [dbo].[team_members] CHECK CONSTRAINT [FK_team_members_user_info]
GO
/****** Object:  ForeignKey [FK_team_project_user_info]    Script Date: 06/09/2016 18:05:42 ******/
ALTER TABLE [dbo].[team_project]  WITH CHECK ADD  CONSTRAINT [FK_team_project_user_info] FOREIGN KEY([generated_userid])
REFERENCES [dbo].[user_info] ([userid])
GO
ALTER TABLE [dbo].[team_project] CHECK CONSTRAINT [FK_team_project_user_info]
GO
/****** Object:  ForeignKey [FK_user_info_pop_options]    Script Date: 06/09/2016 18:05:42 ******/
ALTER TABLE [dbo].[user_info]  WITH CHECK ADD  CONSTRAINT [FK_user_info_pop_options] FOREIGN KEY([user_type_id])
REFERENCES [dbo].[pop_options] ([user_type_id])
GO
ALTER TABLE [dbo].[user_info] CHECK CONSTRAINT [FK_user_info_pop_options]
GO
/****** Object:  ForeignKey [FK_user_login_user_info]    Script Date: 06/09/2016 18:05:42 ******/
ALTER TABLE [dbo].[user_login]  WITH CHECK ADD  CONSTRAINT [FK_user_login_user_info] FOREIGN KEY([userid])
REFERENCES [dbo].[user_info] ([userid])
GO
ALTER TABLE [dbo].[user_login] CHECK CONSTRAINT [FK_user_login_user_info]
GO
