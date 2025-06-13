function Validate(email){
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	console.log("Forms.js caricato correttamente");
	if(email.match(mailformat)){
		return true;
	}
	else{
		return false;
	}
}