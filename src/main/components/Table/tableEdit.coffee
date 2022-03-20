import {View} from "backbone";

import PhonesCollection from "../../collections/index.coffee";

import {Validate} from "../../utils/index.coffee";

export TableEdit = View.extend({
  initialize: (option) ->
    this.render(option);
  template: document.querySelector("#template-table-edit").innerHTML
  events: {
    "click [data-cancel]": "cancel",
    "click [data-ok]": "update",
  },
  render: (option) ->
    renderTemplate = "";

    findItem = PhonesCollection.models.find((item) -> item.id == option.id);

    renderTemplate = this.template.replace(/%name%/g, findItem.attributes.name);
    renderTemplate = renderTemplate.replace(/%phone%/g, findItem.attributes.phone);
    renderTemplate = renderTemplate.replace(/%id%/g, findItem.attributes.id);

    this.el.innerHTML = renderTemplate;
  cancel: ->
    PhonesCollection.trigger("update");
  update: (event) ->
    target = event.target;
    parentElem = target.closest("tr");

    editItem = PhonesCollection.models.find((item) -> item.id == target.getAttribute("data-id"))

    fieldName = parentElem.querySelector("[name=name]").value;
    fieldPhone = parentElem.querySelector("[name=phone]").value;

    isInValid = Validate({
      name: {value: fieldName, el: parentElem.querySelector("[name=name]")},
      phone: {value: fieldPhone, el: parentElem.querySelector("[name=phone]")}
    });

    if (isInValid)
      editItem.set({name: fieldName, phone: fieldPhone});
      PhonesCollection.trigger("update");
});