<cfoutput>
<!--- ContentBoxEvent --->
#cb.event("cbui_BeforeSideBar")#

    <cfif cb.themeSetting( 'sidebarSocial' )>
    <aside id="sparkling-social-2" class="widget sparkling-social">
        <h3 class="widget-title">Follow us</h3>
        <!-- social icons -->
        <div class="social-icons sticky-sidebar-social">

            <nav id="menu-social" class="social-icons">
                <ul id="menu-social-items" class="social-menu">
                    <cfif Len(cb.themeSetting( 'twitter' ))>
                        <li><a href="#cb.themeSetting( 'twitter' )#"><i class="fa fa-twitter"></i></a></li>
                    </cfif>
                    <cfif Len(cb.themeSetting( 'google' ))>
                        <li><a href="#cb.themeSetting( 'google' )#"><i class="fa fa-google-plus"></i></a></li>
                    </cfif>
                    <cfif Len(cb.themeSetting( 'facebook' ))>
                        <li><a href="#cb.themeSetting( 'facebook' )#"><i class="fa fa-facebook"></i></a></li>
                    </cfif>
                    <cfif Len(cb.themeSetting( 'pinterest' ))>
                        <li><a href="#cb.themeSetting( 'pinterest' )#"><i class="fa fa-pinterest"></i></a></li>
                    </cfif>
                    <cfif Len(cb.themeSetting( 'instagram' ))>
                        <li><a href="#cb.themeSetting( 'instagram' )#"><i class="fa fa-instagram"></i></a></li>
                    </cfif>                
                </ul>
            </nav>

        </div><!-- end social icons -->
    </aside>
    </cfif>

    <div class="widget tabbed">
            <div class="tabs-wrapper">
                <ul class="nav nav-tabs">
                      <li><a href="##popular-posts" data-toggle="tab">Popular</a></li>
                      <li><a href="##recent" data-toggle="tab">Recent</a></li>
                      <li><a href="##messages" data-toggle="tab"><i class="fa fa-comments tab-comment"></i></a></li>
                </ul>

                <div class="tab-content">

                    <ul id="recent" class="tab-pane">#cb.widget('MyRecentEntries')#</ul>
                    <ul id="popular-posts" class="tab-pane">#cb.widget('MyRecentEntries')#</ul>

                </div>

            </div>
    </div>

    <aside class="widget">
        <h3 class="widget-title">Popular Posts</h3>

        <!-- popular posts -->
        <div class="tab-content">

            #cb.widget('MyRecentEntries')#

        </div> <!-- end posts wrapper -->

    </aside>

    <aside class="widget">
        <h3 class="widget-title">Categories</h3>
        <!-- social icons -->
        <div class="cats-widget">
            <ul>
                #cb.quickCategories()#
            </ul>
        </div><!-- end social icons -->
    </aside>

    <aside class="widget">
        <form role="search" method="get" class="form-search" action="#cb.linkSearch()#">
          <div class="input-group">
            <label class="screen-reader-text" for="q">Search for:</label>
            <input type="text" class="form-control search-query" placeholder="Search" value="" name="q" title="Search for:">
            <span class="input-group-btn">
              <button type="submit" class="btn btn-default" name="submit" id="searchsubmit" value="Search" style=""><span class="glyphicon glyphicon-search"></span></button>
            </span>
          </div>
        </form>
    </aside>

    <!-- end of sidebar -->


<!--- ContentBoxEvent --->
#cb.event("cbui_afterSideBar")#
</cfoutput>