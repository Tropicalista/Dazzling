<cfoutput>
        <!-- meta -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

		<!--- Site Title --->
		<title>
		<cfif cb.isPageView()>
			#cb.getCurrentPage().getTitle()#
		<cfelse>
			#cb.siteName()# - #cb.siteTagLine()#
		</cfif>
		</title>     

		<!--- ********************************************************************************* --->
		<!--- 					META TAGS														--->
		<!--- ********************************************************************************* --->
		<meta name="viewport" 		content="width=device-width, initial-scale=1">
		<meta charset="utf-8" /> 

		<!--- Meta Description By Page or By Site --->
		<cfif cb.isPageView() AND len( cb.getCurrentPage().getHTMLDescription() )>
			<meta name="description" content="#cb.getCurrentPage().getHTMLDescription()#" />
		<cfelse>
			<meta name="description" content="#HTMLEditFormat( cb.siteDescription() )#" />
		</cfif>

		<!--- Meta Keywords By Page or By Site --->
		<cfif cb.isPageView() AND len( cb.getCurrentPage().getHTMLKeywords() )>
			<meta name="keywords" 	 content="#cb.getCurrentPage().getHTMLKeywords()#" />
		<cfelse>
			<meta name="keywords" 	 content="#cb.siteKeywords()#" />
		</cfif>

		<!--- Base HREF for SES enabled URLs --->
		<base href="#cb.siteBaseURL()#" />

		<!--- ********************************************************************************* --->
		<!--- 					RSS DISCOVERY													--->
		<!--- ********************************************************************************* --->
		<cfif cb.themeSetting( "rssDiscovery", true )>
			<link rel="alternate" type="application/rss+xml" title="Recent Blog Updates" href="#cb.linkRSS()#" />
			<link rel="alternate" type="application/rss+xml" title="Recent Blog Comment Updates" href="#cb.linkRSS(comments=true)#" />
			<link rel="alternate" type="application/rss+xml" title="Recent Page Updates" href="#cb.linkPageRSS()#" />
			<link rel="alternate" type="application/rss+xml" title="Recent Page Comment Updates" href="#cb.linkPageRSS(comments=true)#" />	
			<link rel="alternate" type="application/rss+xml" title="Recent Content Updates" href="#cb.linkSiteRSS()#" />
			<link rel="alternate" type="application/rss+xml" title="Recent Content Comment Updates" href="#cb.linkSiteRSS(comments=true)#" />
			<cfif cb.isEntryView()>
				<link rel="alternate" type="application/rss+xml" title="Entry's Recent Comments" href="#cb.linkRSS( comments=true, entry=cb.getCurrentEntry() )#" />
			</cfif>
		</cfif>		 

		<!--- ********************************************************************************* --->
		<!--- 					CSS 															--->
		<!--- ********************************************************************************* --->

		<!--// Font Family //-->
		<link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>

		<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">

		<!-- injector:css -->
		<link rel="stylesheet" href="#cb.themeRoot()#/includes/css/39daefdb.theme.min.css">
		<!-- endinjector -->

		<!--- ********************************************************************************* --->
		<!--- 					JAVASCRIPT														--->
		<!--- ********************************************************************************* --->
		<!-- injector:js -->
		<link rel="stylesheet" href="#cb.themeRoot()#/includes/css/themes/#lcase( cb.themeSetting( 'cbDazzlingTheme', 'Default' ))#.css?v=1" />
		<!-- endinjector -->

		<!--- ContentBoxEvent --->
		#cb.event("cbui_beforeHeadEnd")#
</cfoutput>