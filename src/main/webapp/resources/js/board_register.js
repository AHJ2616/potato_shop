$(document).ready(function() {
	$('#InputFile').on('change', function(event) {
		const file = event.target.files[0];
		if (file) {
			const reader = new FileReader();

			reader.onload = function(e) {
				$('#image-preview').attr('src', e.target.result);
			};

			reader.readAsDataURL(file);
		} else {
			$('#image-preview').attr('src', '');
		}
	});
});