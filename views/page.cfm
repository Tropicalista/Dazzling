<cfoutput>
<!--- View Arguments --->
<cfparam name="args.print" 		default="false">
<cfparam name="args.sidebar" 	default="false">
<cfset maincol = args.sidebar ? "col-md-8" : "col-md-12">

	<!--- Main Body --->
    <div id="content" class="site-content container">

        <!-- blog-contents -->
    	<div id="primary" class="content-area col-sm-12 col-md-8 pull-left">

            <main id="main" class="site-main">

			    <article class="hentry">

	                <header class="entry-header page-header">
	                    <h1 class="entry-title">
	                        #prc.page.getTitle()#
	                    </h1>
	                	<small><a href="#cb.linkHome()#">Home</a> #cb.breadCrumbs( separator="<i class='fa fa-angle-right'></i> " )#</small>
	                </header>
	                <div class="entry-content">
	                    <p>#prc.page.renderContent()#</p>
	                </div>

			    </article> <!-- /.blog-item -->

				<!--- Comments Bar --->
				<cfif cb.isCommentsEnabled( prc.page )>

				    <div class="comments-area">
				        <h2 class="comments-title">
				            #len(prc.entry.getComments())# thoughts on #prc.entry.getTitle()#
				        </h2>
				        #cb.quickComments()#
				    </div>

				    <div id="respond" class="comment-respond">
				        <h3 id="reply-title" class="comment-reply-title">Leave a Reply</h3>
				        #cb.widget( "MyCommentForm",{content=#prc.entry#} )#
				    </div>

				</cfif>


			</main>

		</div>

		<div id="secondary" class="widget-area col-sm-12 col-md-4">
			#cb.quickView(view='_pagesidebar')#
		</div>

		<cfif args.sidebar>
			<div id="secondary" class="widget-area col-sm-12 col-md-4">
				#cb.quickView(view='_blogsidebar')#
			</div>
		</cfif>

			<!--- ContentBoxEvent --->
			#cb.event("cbui_postPageDisplay")#

    </div>
	
    
</cfoutput>