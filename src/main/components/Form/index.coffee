import {View} from "backbone";

import {PhonesModel} from "../../models/phones.coffee";

import PhonesCollection from "../../collections/index.coffee";

import {nanoid, Validate} from "../../utils/index.coffee";

export Form = View.extend({
  initialize: ->
    this.render();
  template: document.querySelector("#template-form-add-phone").innerHTML,
  events: {
    "submit #add-phone": "addPhone"
  },
  addPhone: (event) ->
    event.preventDefault();

    fieldNameElem = document.querySelector("#add-phone [name=name]");
    fieldPhoneElem = document.querySelector("#add-phone [name=phone]");

    isInValid = Validate({
      name: {value: fieldNameElem.value, el: fieldNameElem},
      phone: {value: fieldPhoneElem.value, el: fieldPhoneElem}
    });

    if (isInValid)
      PhonesCollection.add(new PhonesModel({id: nanoid(), name: fieldNameElem.value, phone: fieldPhoneElem.value}));
      fieldNameElem.value = "";
      fieldPhoneElem.value = "";
  render: ->
    this.el.insertAdjacentHTML("afterbegin", this.template);
});
