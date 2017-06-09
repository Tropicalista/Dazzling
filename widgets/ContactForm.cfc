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
		setIcon( "comment-add" );

		return this;
	}

	/**
	* The main contact form widget
	*/
	any function renderIt(){
		var event 		= getRequestContext();
		var captcha		= "";
		var contactForm = "";

		var rc = event.getCollection();

		if( structKeyExists( rc, "isSent" ) ){

			processForm( rc );

		};

		// captcha?
		saveContent variable="captcha"{
			writeOutput("
				<br>
				<div class='row'>
					<div class='col-md-6'>
						#cb.renderCaptcha()#
					</div>
					<div class='col-md-6'>
						#html.textField( name='captchacode', placeholder='Enter the security code shown above:', class='form-control', groupWrapper='div class=form-group', required='required', size='50' )#
					</div>
				</div>
			");
		}

		// generate comment form
		saveContent variable="contactForm"{
			writeOutput('
			<form name="contactForm" action ="#cb.getContentURL()#" novalidate="novalidate" method="post">

				#getModel( "messagebox@cbMessagebox" ).renderIt()#

				#html.hiddenField(name="isSent",value=true)#

				<div class="row">
					<div class="col-md-12">
						#html.textField( name="name", class="form-control", groupWrapper="div class=form-group", placeholder="Nome", required="required", value=event.getValue("name","") )#
					</div>
					<div class="col-md-12">
						#html.textField( name="subject", class="form-control", groupWrapper="div class=form-group", placeholder="Soggetto", required="required", value=event.getValue("subject","") )#
					</div>
					<div class="col-md-12">
						#html.inputField( name="email", class="form-control", groupWrapper="div class=form-group", placeholder="Email",type="email", required="required", value=event.getValue("email","") )#
					</div>
					<div class="col-md-12">
						#html.textArea( name="message", class="form-control", required="required",rows="5", placeholder="Inserisci il tuo messaggio", value=event.getValue("message","") )#
					</div>
				</div>

				#captcha#

				<div class="row">
					<br>
					<div class="col-md-6">
						<button type="submit" class="submit btn btn-default">Invia messaggio</button>
					</div>
				</div>

				#cb.event("cbui_postcontactForm")#

				

			</form>
			');
		}

		return contactForm;
	}

	function processForm( rc ){

		var commentErrors = [];
		if( !len( rc.name ) ){ 
			arrayAppend( commentErrors, "Nome mancante!" ); 
		}
		if( !len( rc.email ) OR NOT isValid( "email", rc.email ) ){ 
			arrayAppend( commentErrors, "Email mancante o invalida!" ); 
		}
		if( !len( rc.subject ) ){ 
			arrayAppend( commentErrors, "Inserisci il soggetto!" ); 
		}
		if( !len( rc.message ) ){ 
			arrayAppend( commentErrors, "Per favore inserisci un messaggio!" ); 
		}
		if( !len( rc.captchacode ) OR !getModel("captcha@cb").validate( rc.captchacode ) ){
			arrayAppend( commentErrors, "Codice captcha errato!" ); 
		}

		if( arrayLen( commentErrors ) ){
			// Message
			getInstance("messageBox@cbmessagebox")
				.warn( arrayToList( commentErrors, "<br>" ) );

		}else{

			var settings 	= getRequestContext().getValue( name="cbSettings", private=true );
			var mail = getInstance( "mailService@cbmailservices" ).newMail(to=settings.cb_site_email,
										   from=rc.email,
										   subject="#rc.subject# - Author Created - #rc.name#",
										   body=rc.message,
										   type="html",
										   server=settings.cb_site_mail_server,
										   username=settings.cb_site_mail_username,
										   password=settings.cb_site_mail_password,
										   port=settings.cb_site_mail_smtp,
										   useTLS=settings.cb_site_mail_tls,
										   useSSL=settings.cb_site_mail_ssl);

			getInstance("messageBox@cbmessagebox")
				.info("Messaggio inviato!");

		}


	}

}
