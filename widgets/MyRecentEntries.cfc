/**
* ContentBox - A Modular Content Platform
* Copyright since 2012 by Ortus Solutions, Corp
* www.ortussolutions.com/products/contentbox
* ---
* A cool basic widget that shows N recent entries
*/
component extends="contentbox.models.ui.BaseWidget" singleton{

	MyRecentEntries function init(){
		// Widget Properties
		setName( "RecentEntries" );
		setVersion( "1.0" );
		setDescription( "A cool basic widget that shows N recent blog entries." );
		setAuthor( "Ortus Solutions" );
		setAuthorURL( "http://www.ortussolutions.com" );
		setIcon( "list" );

		return this;
	}

	/**
	* Show n recent entries with some cool orderings
	* @max.hint The number of recent entries to show. By default it shows 5
	* @title.hint An optional title to display using an H2 tag.
	* @titleLevel.hint The H{level} to use, by default we use H2
	* @category.hint The list of categories to filter on
	* @category.multiOptionsUDF getAllCategories
	* @searchTerm.hint The search term to filter on
	* @searchTerm.label Search Term
	* @sortOrder.hint How to order the results, defaults to publishedDate
	* @sortOrder.label Sort Order
	* @sortOrder.options Most Recent,Most Popular,Most Commented
	* @showImg.hint Wether to show featured image
	*/
	any function renderIt(
		numeric max=5,
		title="",
		string titleLevel="2",
		string category="",
		string searchTerm="",
		string sortOrder="Most Recent",
		boolean showImg=true
	){
		var event 			= getRequestContext();
		var cbSettings 		= event.getValue( name="cbSettings", private=true );
		
		// Determine Sort Order
		switch( arguments.sortOrder ){
			case "Most Popular" 	: { arguments.sortOrder = "hits DESC";break; }
			case "Most Commented" 	: { arguments.sortOrder = "numberOfComments DESC";break;}
			default : { arguments.sortOrder = "publishedDate DESC"; }
		}

		var entryResults 	= entryService.findPublishedEntries( max=arguments.max,
											   					 category=arguments.category,
											   				 	 searchTerm=arguments.searchTerm,
											   				 	 sortOrder=arguments.sortOrder );
		var rString			= "";

		// iteration cap
		if( entryResults.count lt arguments.max){
			arguments.max = entryResults.count;
		}

		// generate recent comments
		saveContent variable="rString"{
			// title
			if( len(arguments.title) ){ writeOutput( "<h#arguments.titleLevel#>#arguments.title#</h#arguments.titleLevel#>" ); }

			// iterate and create
			for(var x=1; x lte arguments.max; x++){
				writeOutput('<li>');
				if( len( entryResults.entries[ x ].getFeaturedImageURL() ) AND arguments.showImg ){
					writeOutput('<a href="#cb.linkEntry(entryResults.entries[ x ])#" class="tab-thumb thumbnail"><img src="#entryResults.entries[ x ].getFeaturedImageURL()#" width="60" height="60"></a>');
				}
				writeOutput('<div class="content">');
					writeOutput('<a class="tab-entry" href="#cb.linkEntry(entryResults.entries[ x ])#">#entryResults.entries[ x ].getTitle()#</a>');
					writeOutput( "<i>#entryResults.entries[ x ].getDisplayPublishedDate()#</i>" )
				writeOutput( "</div>" );
				// close li
				writeOutput( "</li>" );
			}

		}

		return rString;
	}

	/**
	* Get all the categories
	*/
	array function getAllCategories() cbIgnore{
		return categoryService.getAllNames();
	}

}
