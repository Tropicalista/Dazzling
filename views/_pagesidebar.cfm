<cfoutput>
	<!--- ContentBoxEvent --->
	#cb.event("cbui_beforeSideBar")#
	
	<div class="sidebar-nav">
		<ul>
			#cb.subPageMenu( page=cb.getCurrentPage(), type="li", showNone=false )#
		</ul>
	</div>

	<!--- ContentBoxEvent --->
	#cb.event("cbui_afterSideBar")#
</cfoutput>