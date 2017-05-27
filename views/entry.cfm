<cfoutput>

    <article class="hentry">

        <header class="entry-header page-header">
            <h1 class="entry-title"prc.>
                <a href="#cb.linkEntry(prc.entry)#" rel="bookmark" title="#prc.entry.getTitle()#">#prc.entry.getTitle()#</a>
            </h1>
            <div class="entry-meta">
                <span class="posted-on"><i class="fa fa-calendar"></i> 
                    <time class="entry-date published" datetime="#prc.entry.getDisplayPublishedDate()#">#prc.entry.getDisplayPublishedDate()#</time>
                </span>
                <span class="">
                    <i class="fa fa-user"></i>
                    <span class="author vcard">
                        #prc.entry.getAuthor().getUsername()#
                    </span>
                </span>
                <span class="cat-links"><i class="fa fa-folder-open-o"></i>
                    #cb.quickCategoryLinks(prc.entry)#            
                </span>                        
            </div>
        </header>
        
        <div class="entry-content">
            #prc.entry.renderContent()#
        </div>

    </article> <!-- /.blog-item -->

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

</cfoutput>