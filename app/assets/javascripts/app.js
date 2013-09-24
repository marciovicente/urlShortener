
function initialize(){

	$('.new_url').submit(function(e){
		e.preventDefault();
		var url = $(this).attr('action');
		var data = $(this).serialize();
		var urlToConvert = $('#url_url').val();

		if(!validateUrl(urlToConvert)){
			$('.errors').html('É necessário informar uma URL válida').addClass('active');
		}else{
			$.ajax({
				type:'POST',
				dataType:'json',
				url: url,
				data: data,

				success: function(dados){
					var url = window.location.href;
					$('.errors').removeClass('active');
					$('.formatted').addClass('active').find('.urlShortener').html(url+dados.alias);
				},
				error: function(){
					console.warn("Erro ao salvar");
				}
			});
		}
		
	});
}



function validateUrl(str) {
	var pattern = new RegExp('^(https?:\\/\\/)?'+ // protocol
	'((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.)+[a-z]{2,}|'+ // domain name
	'((\\d{1,3}\\.){3}\\d{1,3}))'+ // OR ip (v4) address
	'(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*'+ // port and path
	'(\\?[;&a-z\\d%_.~+=-]*)?'+ // query string
	'(\\#[-a-z\\d_]*)?$','i'); // fragment locator

	if(!pattern.test(str)) 
    	return false;
	else 
    	return true;
  
  
}