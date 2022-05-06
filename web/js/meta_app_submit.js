function init() {
  $("#account").val(web3.eth.accounts[0]);
  moment.locale();
}

function addLibrary() {
  smartContract.sol_addLibrary(
  $("#no").val(),
  $("#lib_element").val(),
  $("#stride").val().toString(),
  $("#contents").val(),
  $("#url").val(),
  $("#lib_writer").val(),
    { from: $("#account").val(), gas: 3000000 },
    (err, result) => {
      if (!err) {
        alert("The transaction was sent successfully.\n" + result);
        console.log(result);
        var stride_str = $("#stride").val().toString(); // Convert to string
        addLibrary_db('./meta_lib_db',{no:$("#no").val(), lib_element:$("#lib_element").val(),
        stride:stride_str, contents:$("#contents").val(), url:$("#url").val(),lib_writer:$("#lib_writer").val()}); 
      }
    }
  );
}

function addLibrary_db(path, params, method='post') {
  const form = document.createElement('form');
  form.method = method;
  form.action = path;
  for (const key in params) {
    if (params.hasOwnProperty(key)) {
      const hiddenField = document.createElement('input');
      hiddenField.type = 'hidden';
      hiddenField.name = key;
      hiddenField.value = params[key];
      form.appendChild(hiddenField);
    }
  }
  document.body.appendChild(form);
  form.submit();
}

function addThreat() {
  smartContract.sol_addThreat(
  $("#threat_number").val(),
  $("#threat_element").val(),
  $("#threat_detail").val(),
  $("#threat_reason").val(),
  $("#lib_number").val(),
  $("#threat_writer").val(),
    { from: $("#account").val(), gas: 3000000 },
    (err, result) => {
      if (!err) {
        alert("The transaction was sent successfully.\n" + result);
        addThreat_db('./meta_threats_db',{threat_number:$("#threat_number").val(), threat_element:$("#threat_element").val(),
        threat_detail:$("#threat_detail").val(), threat_reason:$("#threat_reason").val(), lib_number:$("#lib_number").val(), 
        threat_writer:$("#threat_writer").val()}); 
      }
    }
  );
}

function addThreat_db(path, params, method='post') {
  const form = document.createElement('form');
  form.method = method;
  form.action = path;
  for (const key in params) {
    if (params.hasOwnProperty(key)) {
      const hiddenField = document.createElement('input');
      hiddenField.type = 'hidden';
      hiddenField.name = key;
      hiddenField.value = params[key];
      form.appendChild(hiddenField);
    }
  }
  document.body.appendChild(form);
  form.submit();
}

$(function() {
  init();
});
