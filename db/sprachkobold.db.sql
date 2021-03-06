USE [master]
GO
/****** Object:  Database [Sprachkobold]    Script Date: 17/09/2019 22:37:08 ******/
CREATE DATABASE [Sprachkobold]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sprachkobold', FILENAME = N'C:\Work\tg\dbs\sprachkobold\Sprachkobold.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sprachkobold_log', FILENAME = N'C:\Work\tg\dbs\sprachkobold\Sprachkobold_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Sprachkobold] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sprachkobold].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sprachkobold] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sprachkobold] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sprachkobold] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sprachkobold] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sprachkobold] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sprachkobold] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sprachkobold] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sprachkobold] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sprachkobold] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sprachkobold] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sprachkobold] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sprachkobold] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sprachkobold] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sprachkobold] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sprachkobold] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sprachkobold] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sprachkobold] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sprachkobold] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sprachkobold] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sprachkobold] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sprachkobold] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sprachkobold] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sprachkobold] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Sprachkobold] SET  MULTI_USER 
GO
ALTER DATABASE [Sprachkobold] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sprachkobold] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sprachkobold] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sprachkobold] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sprachkobold] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sprachkobold] SET QUERY_STORE = OFF
GO
USE [Sprachkobold]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Sprachkobold]
GO
/****** Object:  Table [dbo].[Example]    Script Date: 17/09/2019 22:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Example](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OriginalForm] [nvarchar](200) NOT NULL,
	[Translation] [nvarchar](2000) NULL,
	[WordId] [int] NOT NULL,
 CONSTRAINT [PK_Example] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idiom]    Script Date: 17/09/2019 22:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Idiom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OriginalForm] [nvarchar](2000) NOT NULL,
	[Translation] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Idiom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 17/09/2019 22:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LanguageHelper]    Script Date: 17/09/2019 22:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LanguageHelper](
	[LanguageId] [int] NOT NULL,
	[BaseForm] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_LanguageHelper] PRIMARY KEY CLUSTERED 
(
	[LanguageId] ASC,
	[BaseForm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Noun]    Script Date: 17/09/2019 22:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Noun](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Article] [nvarchar](50) NOT NULL,
	[PluralForm] [nvarchar](250) NULL,
	[IsWeak] [bit] NULL,
 CONSTRAINT [PK_Noun] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 17/09/2019 22:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Translation]    Script Date: 17/09/2019 22:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Translation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](500) NOT NULL,
	[VocabularyId] [int] NOT NULL,
 CONSTRAINT [PK_Translation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TranslationTag]    Script Date: 17/09/2019 22:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TranslationTag](
	[TranslationId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_TranslationTag] PRIMARY KEY CLUSTERED 
(
	[TranslationId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 17/09/2019 22:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Verb]    Script Date: 17/09/2019 22:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Verb](
	[Id] [int] NOT NULL,
	[PreteritumForm] [nvarchar](250) NULL,
	[PastPerfect] [nvarchar](250) NULL,
	[ConjugationVerb] [nvarchar](250) NULL,
 CONSTRAINT [PK_Verb] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vocabulary]    Script Date: 17/09/2019 22:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vocabulary](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[LearningLanguageId] [int] NOT NULL,
	[TranslationLanguageId] [int] NOT NULL,
 CONSTRAINT [PK_Vocabulary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Word]    Script Date: 17/09/2019 22:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Word](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BaseForm] [nvarchar](250) NOT NULL,
	[WordType] [smallint] NOT NULL,
	[VocabularyId] [int] NOT NULL,
 CONSTRAINT [PK_Word] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WordIdiom]    Script Date: 17/09/2019 22:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WordIdiom](
	[WordId] [int] NOT NULL,
	[Idiomid] [int] NOT NULL,
 CONSTRAINT [PK_WordIdiom] PRIMARY KEY CLUSTERED 
(
	[WordId] ASC,
	[Idiomid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WordTag]    Script Date: 17/09/2019 22:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WordTag](
	[WordId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_WordTag] PRIMARY KEY CLUSTERED 
(
	[WordId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WordTranslation]    Script Date: 17/09/2019 22:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WordTranslation](
	[WordId] [int] NOT NULL,
	[TranslationId] [int] NOT NULL,
 CONSTRAINT [PK_WordTranslation] PRIMARY KEY CLUSTERED 
(
	[WordId] ASC,
	[TranslationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Example]  WITH CHECK ADD  CONSTRAINT [FK_Example_Word] FOREIGN KEY([WordId])
REFERENCES [dbo].[Word] ([Id])
GO
ALTER TABLE [dbo].[Example] CHECK CONSTRAINT [FK_Example_Word]
GO
ALTER TABLE [dbo].[LanguageHelper]  WITH CHECK ADD  CONSTRAINT [FK_LanguageHelper_LanguageHelper] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([Id])
GO
ALTER TABLE [dbo].[LanguageHelper] CHECK CONSTRAINT [FK_LanguageHelper_LanguageHelper]
GO
ALTER TABLE [dbo].[Translation]  WITH CHECK ADD  CONSTRAINT [FK_Translation_Vocabulary] FOREIGN KEY([VocabularyId])
REFERENCES [dbo].[Vocabulary] ([Id])
GO
ALTER TABLE [dbo].[Translation] CHECK CONSTRAINT [FK_Translation_Vocabulary]
GO
ALTER TABLE [dbo].[TranslationTag]  WITH CHECK ADD  CONSTRAINT [FK_TranslationTag_Tag] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tag] ([Id])
GO
ALTER TABLE [dbo].[TranslationTag] CHECK CONSTRAINT [FK_TranslationTag_Tag]
GO
ALTER TABLE [dbo].[TranslationTag]  WITH CHECK ADD  CONSTRAINT [FK_TranslationTag_Translation] FOREIGN KEY([TranslationId])
REFERENCES [dbo].[Translation] ([id])
GO
ALTER TABLE [dbo].[TranslationTag] CHECK CONSTRAINT [FK_TranslationTag_Translation]
GO
ALTER TABLE [dbo].[Vocabulary]  WITH CHECK ADD  CONSTRAINT [FK_Vocabulary_Language] FOREIGN KEY([LearningLanguageId])
REFERENCES [dbo].[Language] ([Id])
GO
ALTER TABLE [dbo].[Vocabulary] CHECK CONSTRAINT [FK_Vocabulary_Language]
GO
ALTER TABLE [dbo].[Vocabulary]  WITH CHECK ADD  CONSTRAINT [FK_Vocabulary_TranslationLanguage] FOREIGN KEY([TranslationLanguageId])
REFERENCES [dbo].[Language] ([Id])
GO
ALTER TABLE [dbo].[Vocabulary] CHECK CONSTRAINT [FK_Vocabulary_TranslationLanguage]
GO
ALTER TABLE [dbo].[Word]  WITH CHECK ADD  CONSTRAINT [FK_Word_Vocabulary] FOREIGN KEY([VocabularyId])
REFERENCES [dbo].[Vocabulary] ([Id])
GO
ALTER TABLE [dbo].[Word] CHECK CONSTRAINT [FK_Word_Vocabulary]
GO
ALTER TABLE [dbo].[WordIdiom]  WITH CHECK ADD  CONSTRAINT [FK_WordIdiom_Idiom] FOREIGN KEY([Idiomid])
REFERENCES [dbo].[Idiom] ([Id])
GO
ALTER TABLE [dbo].[WordIdiom] CHECK CONSTRAINT [FK_WordIdiom_Idiom]
GO
ALTER TABLE [dbo].[WordIdiom]  WITH CHECK ADD  CONSTRAINT [FK_WordIdiom_Word] FOREIGN KEY([WordId])
REFERENCES [dbo].[Word] ([Id])
GO
ALTER TABLE [dbo].[WordIdiom] CHECK CONSTRAINT [FK_WordIdiom_Word]
GO
ALTER TABLE [dbo].[WordTag]  WITH CHECK ADD  CONSTRAINT [FK_WordTag_Tag] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tag] ([Id])
GO
ALTER TABLE [dbo].[WordTag] CHECK CONSTRAINT [FK_WordTag_Tag]
GO
ALTER TABLE [dbo].[WordTag]  WITH CHECK ADD  CONSTRAINT [FK_WordTag_WordTag] FOREIGN KEY([WordId])
REFERENCES [dbo].[Word] ([Id])
GO
ALTER TABLE [dbo].[WordTag] CHECK CONSTRAINT [FK_WordTag_WordTag]
GO
ALTER TABLE [dbo].[WordTranslation]  WITH CHECK ADD  CONSTRAINT [FK_WordTranslation_Translation] FOREIGN KEY([TranslationId])
REFERENCES [dbo].[Translation] ([id])
GO
ALTER TABLE [dbo].[WordTranslation] CHECK CONSTRAINT [FK_WordTranslation_Translation]
GO
ALTER TABLE [dbo].[WordTranslation]  WITH CHECK ADD  CONSTRAINT [FK_WordTranslation_Word] FOREIGN KEY([WordId])
REFERENCES [dbo].[Word] ([Id])
GO
ALTER TABLE [dbo].[WordTranslation] CHECK CONSTRAINT [FK_WordTranslation_Word]
GO
USE [master]
GO
ALTER DATABASE [Sprachkobold] SET  READ_WRITE 
GO
