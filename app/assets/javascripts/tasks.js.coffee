# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$(document).ready ->
    $('#task_task_type_id').change ->
        selectValue = $(this).val()
        if selectValue == ''
            $('.task_type_fields').html('')
        else
            $.ajax(
                url: '/tasks/attributes/?task_type_id=' + selectValue,
                success: (html) ->
                    $('.task_type_fields').html(html)
                    $('.task_type_fields input').each () ->
                        alert $(this).attr('name')
                    
            )
    $('#task_task_type_id').change()
