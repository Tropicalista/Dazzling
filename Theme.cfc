/**
* ContentBox - A Modular Content Platform
* Copyright since 2012 by Ortus Solutions, Corp
* www.ortussolutions.com/products/contentbox
* 
*/
component{

 	property name="menuService" 	inject="id:MenuService@cb";

	// Layout Variables
    this.name       	= "Dazzling";
	this.description 	= "Dazzling theme by https://colorlib.com";
	this.version		= "1.0.0";
	this.author 		= "Tropicalista";
	this.authorURL		= "http://www.tropicalseo.net";
	// Screenshot URL, can be absolute or locally in your layout package.
	this.screenShotURL	= "screenshot.png";

	// Layout Settings
	this.settings = [
		{ name="cbDazzlingTheme", 	defaultValue="Default",	type="select", 		label="Choose theme:",	required="false",	options="Default,Azure,Blue" },
		{ name="headerMainNav", 	defaultValue="none", 	type="select", 		label="Main Navigation:", optionsUDF="menus", fieldDescription="Select a menu for the Main Navigation.",	group="Header"},
		{ name="facebook", 			defaultValue="", 		type="text", 		label="Facebook link:",		group="Header" },
		{ name="google", 			defaultValue="", 		type="text", 		label="Google+ link:",		group="Header" },
		{ name="twitter", 			defaultValue="", 		type="text", 		label="Twitter link:",		group="Header" },
		{ name="pinterest", 		defaultValue="", 		type="text", 		label="Pinterest link:",	group="Header" },
		{ name="instagram", 		defaultValue="", 		type="text", 		label="Instagram link:",	group="Header" },
		{ name="sidebarSocial", 	defaultValue="false",	type="boolean", 	label="Display social icons on sidebar:",	group="Sidebar" },
		{ name="showPopular", 		defaultValue="false",	type="boolean", 	label="Display popular section:",	group="Sidebar" },
		{ name="showTabbed", 		defaultValue="false",	type="boolean", 	label="Display tabbed popular section:",	group="Sidebar" },
		{ name="footerText", 		defaultValue="", 		type="textarea", 	label="Footer text:",	group="Footer" },
		{ name="footerSocial", 		defaultValue="false", 	type="boolean", 	label="Display social icons on footer:",	group="Footer" },
		{ name="footerWidget", 		defaultValue="false", 	type="boolean", 	label="Display widgets on footer:",	group="Footer" }
	];

	/**
	* Call Back when layout is activated
	*/
	function onActivation(){

	}

	/**
	* Call Back when layout is deactivated
	*/
	function onDeactivation(){

	}

	/**
	* Call Back when layout is deleted from the system
	*/
	function onDelete(){

	}

	/**
	* Gets all menu slugs
	*/
	string function menus() { 
		var menuList = arraytoList( menuService.getAllSlugs() );
		menuList = ListPrepend( menuList, "none" );
		return menuList;
	}

}
