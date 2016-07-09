<cfoutput>
<div id="footer-area">

    <cfif cb.themeSetting( 'footerWidget' )>
        <div class="container footer-inner">

            <div class="footer-widget-area">
                <div class="col-sm-6 col-md-4 footer-widget widget">

                    <h3 class="widgettitle">Popular Posts</h3>

                    <!-- popular posts -->
                    <div class="tab-content">
                        <ul>
                            #cb.widget( 'MyRecentEntries', {showImg=false} )#
                        </ul>
                    </div> <!-- end posts wrapper -->
                
                </div>

                <div class="col-sm-6 col-md-4 footer-widget widget">

                    <h3 class="widgettitle">Categories</h3>
                    <!-- social icons -->
                    <div>
                        <ul>
                            #cb.quickCategories()#
                        </ul>
                    </div><!-- end social icons -->

                </div>

                <div class="col-sm-6 col-md-4 footer-widget">

                </div>
            </div>

        </div>
    </cfif>

    <footer id="colophon" class="site-footer" role="contentinfo">

        <div class="site-info container">

            <div class="row">

                <cfif cb.themeSetting( 'footerSocial' )>
                    <nav id="menu-social" class="social-icons">
                        <!-- footer social buttons -->
                        <ul id="menu-social-items" class="social-menu">
                            <cfif Len(cb.themeSetting( 'twitter' ))>
                                <li><a href="#cb.themeSetting( 'twitter' )#"><i class="fa fa-twitter"><span>Twitter</span></i></a></li>
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
                </cfif>

                <!-- footer-nav -->
                <nav role="navigation" class="col-md-6">
                    <ul id="menu-flat-footer" class="nav footer-nav clearfix">
                        <li><a href="sitemap">Sitemap</a></li>
                        <li><a href="privacy">Privacy</a></li>
                        <li><a href="contatti">Contatti</a></li>
                    </ul>
                </nav>

                <div class="copyright col-md-6">
                    #cb.themeSetting( 'footerText' )#
                </div>

            </div>

        </div>

        <div class="scroll-to-top" style="display: block;">
            <i class="fa fa-angle-up"></i>
        </div>

    </footer>

</div>
</cfoutput>