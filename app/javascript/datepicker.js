document.addEventListener('DOMContentLoaded', function () {
    var picker = new Pikaday({ field: document.getElementById('datepicker'),
    yearRange: [1900, moment().year()], 
    });
  });
  