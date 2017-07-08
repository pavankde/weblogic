/*
 Functions to support forms handling using jQuery in WLS

 Copyright (c) 2015, Oracle and/or its affiliates. All rights reserved.
 */

// This assumes jQuery is already loaded and updates the wls.console namespace
(function(ns) {
  ns.getField = function (field, prefix) {
    var $field;
    // try to get by id
    $field = $("#" + prefix + field);
    if (!$field.length) {
      // no field. try to get by name. only applicable for radio buttons
      $field = $("input:radio[name=" + prefix + field + "]");
    }
    return $field.length > 0 ? $field : null;
  };

  ns.setValues = function (fields, prefix, data) {
    if (!$.isArray(fields)) {
      fields = [fields];
    }
    var self = this;
    $.each(fields, function (index, property) {
      var $field = self.getField(property, prefix);
      var value = data ? data[property] : "-";
      if ($field && data[property]) {
        if ($field.is(":input")) {
          $field.val(value);
        } else {
          $field.text(value);
        }
      }
    });
  };

  ns.setROValues = function(fields, prefix, data) {
    // sets the values on readonly fields which are identified by the ID+RO
    if(!$.isArray(fields)) {
      fields = [fields];
    }
    var fields = $.map(fields, function(field) {
      var roField = field + "RO";
      if(data[field] !== "undefined") {
        data[roField] = data[field];
      }
      return roField;
    });
    ns.setValues(fields, prefix, data);
  }
}(wls.console));
