USE [kryptodb]
GO
/****** Object:  Table [dbo].[Journal]    Script Date: 23.05.2023 9:35:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Journal](
	[action_id] [int] IDENTITY(1,1) NOT NULL,
	[filename] [nvarchar](max) NULL,
	[action] [varchar](50) NULL,
	[action_date] [datetime] NULL,
	[action_user] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 23.05.2023 9:35:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_type] [varchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 23.05.2023 9:35:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_surname] [varchar](50) NULL,
	[user_name] [varchar](50) NULL,
	[user_subname] [varchar](50) NULL,
	[user_login] [varchar](50) NULL,
	[user_password] [varchar](50) NULL,
	[user_role] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([role_id], [role_type]) VALUES (1, N'user')
INSERT [dbo].[Role] ([role_id], [role_type]) VALUES (2, N'admin')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([user_id], [user_surname], [user_name], [user_subname], [user_login], [user_password], [user_role]) VALUES (1, N's', N's', N's', N'user', N'user', 1)
INSERT [dbo].[User] ([user_id], [user_surname], [user_name], [user_subname], [user_login], [user_password], [user_role]) VALUES (2, N'a', N'a', N'a', N'admin', N'admin', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Journal]  WITH CHECK ADD  CONSTRAINT [FK_Journal_User] FOREIGN KEY([action_user])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Journal] CHECK CONSTRAINT [FK_Journal_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([user_role])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
