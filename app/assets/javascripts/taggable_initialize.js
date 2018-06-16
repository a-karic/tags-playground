$( document ).on('turbolinks:load', function() {
  if ($('#link_url').length > 0) {
    $('#link_url').on('change', updateTags);
  }
});

function updateTags(event) {
  var url = $(event.currentTarget).val();
  $.ajax({
    type: "GET",
    url: "/tags/from_users",
    data: { url: url },
    success: function(data) {
      if (data.length > 0) {
        $("#suggested-tags").removeClass('d-none');
      }
      for (el in data) {
        $('#suggested-tags').append(
          '<div>' + data[el]['name'] + ', occurrences: ' + data[el]['taggings_count'] +  '</div>'
        );
      };
    }
  });

  $.ajax({
    type: "GET",
    url: "/tags/from_page",
    data: { url: url },
    success: function(data) {
      if (data.length > 0) {
        $("#suggested-tags-from-page").removeClass('d-none');
      }
      for (el in data) {
        $('#suggested-tags-from-page').append(
          '<div>' + data[el]['name'] + ', count: ' + data[el]['count'] +  '</div>'
        );
      };
    }
  });
}
