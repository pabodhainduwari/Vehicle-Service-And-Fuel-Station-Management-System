function editRow(button) {
    const row = button.closest("tr");
    const cells = row.querySelectorAll("td");
	
	const deleteButton = row.querySelector("#deleteButton"); // Selecting delete button in the same row
	
    if (button.textContent === "Update") {
		
		if (deleteButton) {
		            deleteButton.style.display = 'none'; // Hides the delete button
		 }

        // Turn cells into input fields for fuelName, stockAmount, pricePerUnit
        const fuelName = cells[1].textContent;
        const stockAmount = cells[2].textContent;
        const pricePerUnit = cells[3].textContent;

       

        // Set cells to inputs for editing
        cells[1].innerHTML = `<input type="text" value="${fuelName}" />`;
        cells[2].innerHTML = `<input type="text" value="${stockAmount}" />`;
        cells[3].innerHTML = `<input type="text" value="${pricePerUnit}" />`;

        button.textContent = "Save";
		// Optional: Add cancel button to reload page
				const cancelBtn = document.createElement("button");
				    
				cancelBtn.id = "cancelButton"; // assign an id
				cancelBtn.classList.add("buttons"); // add it a class
				cancelBtn.textContent = "Cancel"; // change inner text
				    
				cancelBtn.onclick = () => location.reload(); //reload when cancel
				//adds the cacle buttons as the last child of the parent of main button(update)
				button.parentNode.appendChild(cancelBtn);
				
        // Create hidden inputs for form submission
		const form = button.closest("form");
		        const hiddenInputs = form.querySelectorAll('input[type="hidden"]');
		        hiddenInputs.forEach(input => input.remove());
				
			

        
    } else {
        // When clicking "Save", get the updated values from the inputs
        

        const updatedFuelName = cells[1].querySelector("input") ? cells[1].querySelector("input").value : null;
        const updatedStockAmount = cells[2].querySelector("input") ? cells[2].querySelector("input").value : null;
        const updatedPricePerUnit = cells[3].querySelector("input") ? cells[3].querySelector("input").value : null;

        // Debugging: Log the updated values
        console.log("Updated Fuel Name: ", updatedFuelName);
        console.log("Updated Stock Amount: ", updatedStockAmount);
        console.log("Updated Price per Unit: ", updatedPricePerUnit);

        // Check if any of the values are null or empty
        if (!updatedFuelName || !updatedStockAmount || !updatedPricePerUnit) {
            console.log("One or more input values are null or empty.");
            return;  // Do not submit if any value is missing
        }

        // Submit the form with updated values
        const form = button.closest("form");
        form.innerHTML += `
            <input type="hidden" name="fuelNumber" value="${cells[0].textContent}">
            <input type="hidden" name="fuelName" value="${updatedFuelName}">
            <input type="hidden" name="stockAmount" value="${updatedStockAmount}">
            <input type="hidden" name="pricePerUnit" value="${updatedPricePerUnit}">
        `;

        // Set form action to update servlet and submit
        form.action = "updateFuelServlet";
        form.submit();
    }
}

function deleteRow(button){
	
	const row = button.closest("tr");
	const cells = row.querySelectorAll("td");
	
	const fuelNumber = cells[0].textContent;
	const form = button.closest("form");
	
	const input = document.createElement("input");
	    input.type = "hidden";
	    input.name = "fuelNumber"; // The name of the parameter expected by the servlet
	    input.value = fuelNumber;

	    // Append the hidden input to the form
	    form.appendChild(input);

	
		form.action = "deleteFuelServlet";
		form.submit();
}


function validateInput() {
    const stockAmount = document.getElementById("stockAmount").value;
    const pricePerUnit = document.getElementById("pricePerUnit").value;

    const intRegex = /^\d+$/;
    const decimalRegex = /^\d+(\.\d+)?$/;


    if (stockAmount !== "" && !intRegex.test(stockAmount)) {
      document.getElementById("stockError").style.display ='flex';
    } 
    else {
      document.getElementById("stockError").style.display ='none';
    }
    if (pricePerUnit !== "" && !decimalRegex.test(pricePerUnit)) {
      document.getElementById("priceError").style.display ='flex'
    }
    else {
      document.getElementById("priceError").style.display ='none';
    }
}


function validateForm(){
  
  const stockAmount = document.getElementById("stockAmount").value;
  const pricePerUnit = document.getElementById("pricePerUnit").value;
  let isValid = true;
  const intRegex = /^\d+$/;
  const decimalRegex = /^\d+(\.\d+)?$/;

  if (stockAmount !== "" && !intRegex.test(stockAmount)) {
    document.getElementById("stockError").style.display ='flex';
	isValid = false;
  } 
  else {
    document.getElementById("stockError").style.display ='none';
    
    
  }
  if (pricePerUnit !== "" && !decimalRegex.test(pricePerUnit)) {
    document.getElementById("priceError").style.display ='flex'
	isValid = false;
  }
  else {
    document.getElementById("priceError").style.display ='none';
    
  }
return isValid;
  
}

function toggleForm(){
  var form = document.getElementById("addNewFuelForm");
  var button = document.getElementById("addNewFuelButton");

  if (form.style.display === "none") {
      form.style.display = "block";
      button.textContent = "Cancel";
  }
  else {
      form.style.display = "none";
      button.textContent = "Add New";
  }
}

















