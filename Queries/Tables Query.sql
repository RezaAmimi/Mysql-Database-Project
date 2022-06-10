CREATE TABLE [dbo].[classroom](
	[building] [varchar](255) NOT NULL,
	[room_number] [int] NOT NULL,
	[capacity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[building] ASC,
	[room_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[course](
	[course_id] [varchar](255) NOT NULL,
	[title] [varchar](255) NULL,
	[credits] [int] NULL,
	[prereq_id] [varchar](255) NULL,
	[dept_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[department](
	[dept_name] [varchar](255) NOT NULL,
	[building] [varchar](255) NULL,
	[budget] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[dept_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]



CREATE TABLE [dbo].[instructor](
	[ID] [varchar](255) NOT NULL,
	[name] [varchar](255) NULL,
	[salary] [int] NULL,
	[dept_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[sec_class](
	[course_id] [varchar](255) NOT NULL,
	[section_id] [int] NOT NULL,
	[semester] [int] NOT NULL,
	[year] [float] NOT NULL,
	[building] [varchar](255) NULL,
	[room_number] [int] NULL,
	[capacity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC,
	[section_id] ASC,
	[semester] ASC,
	[year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[sec_time_slot](
	[course_id] [varchar](255) NOT NULL,
	[section_id] [int] NOT NULL,
	[semester] [int] NOT NULL,
	[year] [float] NOT NULL,
	[day] [varchar](255) NULL,
	[start_time] [varchar](255) NULL,
	[end_time] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC,
	[section_id] ASC,
	[semester] ASC,
	[year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[section](
	[course_id] [varchar](255) NOT NULL,
	[section_id] [int] NOT NULL,
	[semester] [int] NOT NULL,
	[year] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC,
	[section_id] ASC,
	[semester] ASC,
	[year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[student](
	[ID] [varchar](255) NOT NULL,
	[name] [varchar](255) NULL,
	[tot_cred] [int] NULL,
	[dept_name] [varchar](255) NULL,
	[advisor_id] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[takes](
	[course_id] [varchar](255) NOT NULL,
	[section_id] [int] NOT NULL,
	[semester] [int] NOT NULL,
	[year] [float] NOT NULL,
	[ID] [varchar](255) NOT NULL,
	[grade] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC,
	[section_id] ASC,
	[semester] ASC,
	[year] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[teaches](
	[course_id] [varchar](255) NOT NULL,
	[section_id] [int] NOT NULL,
	[semester] [int] NOT NULL,
	[year] [float] NOT NULL,
	[ID] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC,
	[section_id] ASC,
	[semester] ASC,
	[year] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[time_slot](
	[day] [varchar](255) NOT NULL,
	[start_time] [varchar](255) NOT NULL,
	[end_time] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[day] ASC,
	[start_time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

