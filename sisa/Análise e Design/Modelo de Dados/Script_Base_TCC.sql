USE [master]
GO

/****** Object:  Database [tcc]    Script Date: 01/30/2011 23:01:45 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'tcc')
DROP DATABASE [tcc]
GO

USE [master]
GO

/****** Object:  Database [tcc]    Script Date: 01/30/2011 23:01:45 ******/
CREATE DATABASE [tcc] ON  PRIMARY 
( NAME = N'tcc', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\tcc.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'tcc_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\tcc_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [tcc] SET COMPATIBILITY_LEVEL = 80
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tcc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [tcc] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [tcc] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [tcc] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [tcc] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [tcc] SET ARITHABORT OFF 
GO

ALTER DATABASE [tcc] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [tcc] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [tcc] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [tcc] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [tcc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [tcc] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [tcc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [tcc] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [tcc] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [tcc] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [tcc] SET  DISABLE_BROKER 
GO

ALTER DATABASE [tcc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [tcc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [tcc] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [tcc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [tcc] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [tcc] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [tcc] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [tcc] SET  READ_WRITE 
GO

ALTER DATABASE [tcc] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [tcc] SET  MULTI_USER 
GO

ALTER DATABASE [tcc] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [tcc] SET DB_CHAINING OFF 
GO

