function validateForm(){
			const price = document.getElementById("price").value;
			
			if (price <= 0) {
		        alert("Price must be a positive number.");
		        return false;
		    }
			return true;
		}