import {View} from "backbone";

import {PhonesModel} from "../../models/phones.coffee";

import {TableContent} from "./tableContent.coffee";

export Table = View.extend({
  initialize: ->
    this.render();
  template: document.querySelector("#template-table").innerHTML,
  render: ->
    this.el.insertAdjacentHTML("afterbegin", this.template);

    new TableContent({
      el: document.querySelector("#show-phones-list")
    });
});