import {View} from "backbone";

import PhonesCollection from "../../collections/index.coffee";

import {Validate} from "../../utils/index.coffee";

export TableEdit = View.extend({
  initialize: (option) ->
    this.render(option);
  template: document.querySelector("#template-table-edit").innerHTML,
  events: {
    "click [data-cancel]": "cancel",
    "click [data-save]": "update",
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

    editItem = PhonesCollection.models.find((item) -> item.id == target.getAttribute("data-id"));

    fieldNameElem = parentElem.querySelector("[name=name]");
    fieldPhoneElem = parentElem.querySelector("[name=phone]");

    isInValid = Validate({
      name: {value: fieldNameElem.value, el: fieldNameElem},
      phone: {value: fieldPhoneElem.value, el: fieldPhoneElem}
    });

    if (isInValid)
      editItem.set({name: fieldNameElem.value, phone: fieldPhoneElem.value});
      PhonesCollection.trigger("update");
});