/**
* A cool basic contact form for ContentBox
*/
component extends="contentbox.models.ui.BaseWidget" singleton{

	ContactForm function init(){
		// super init
		//super.init();

		// Widget Properties
		setName("ContactForm");
		setVersion("1.0");
		setDescription("A cool basic contact form.");
		setAuthor("Tropicalista");
		setAuthorURL("http://www.tropicalseo.net");
		setIcon( "comment-add.png" );
		setCategory( "Miscellaneous" );
		return this;
	}

	/**
	* The main contact form widget
	* @content.hint The content object to build the comment form for: page or entry
	*/
	any function renderIt(any content){
		var event 		= getRequestContext();
		var cbSettings 	= event.getValue(name="cbSettings",private=true);
		var captcha		= "";
		var contactForm = "";
		
		// captcha?
		saveContent variable="captcha"{
			writeOutput("
				<br>
				<div class='row'>
					<div class='col-md-6'>
						<img src='#event.buildLink( event.getValue( 'cbEntryPoint', '', true) & '__captcha')#'>
					</div>
					<div class='col-md-6'>
						#html.textField(name='captchacode',placeholder='Enter the security code shown above:',class='form-control',groupWrapper='div class=form-group',required='required',size='50')#
					</div>
				</div>
			");
		}

		// generate comment form
		saveContent variable="contactForm"{
			writeOutput('
			#html.startForm(name="contactForm",action=cb.linkCommentPost(arguments.content),novalidate="novalidate")#

				#getModel( "messagebox@cbMessagebox" ).renderIt()#

				<div class="row">
					<div class="col-md-12">
						#html.textField(name="name", class="form-control", groupWrapper="div class=form-group", placeholder="Name", required="required", value=event.getValue("name",""))#
					</div>
					<div class="col-md-12">
						#html.inputField(name="email", class="form-control", groupWrapper="div class=form-group", placeholder="Email",type="email", required="required", value=event.getValue("email",""))#
					</div>
					<div class="col-md-12">
						#html.textArea(name="message", class="form-control", required="required",rows="5", placeholder="Type here message", value=event.getValue("message",""))#
					</div>
				</div>

				#captcha#

				<div class="row">
					<br>
					<div class="col-md-6">
						<button type="submit" class="submit btn btn-default">Post Comment</button>
					</div>
				</div>

				#cb.event("cbui_postcontactForm")#

				

			#html.endForm()#
			');
		}

		return contactForm;
	}

}
