import {View} from "backbone";

import PhonesCollection from "../../collections/index.coffee";

import {TableEdit} from "./tableEdit.coffee";

export TableContent = View.extend({
  initialize: () ->
    this.listenTo(PhonesCollection, "update", this.render);
    this.render();
  template: document.querySelector("#template-table-item").innerHTML
  events: {
    "click [data-edit]": "editItem",
    "click [data-delete]": "deleteItem"
  },
  render: () ->
    renderTemplate = "";

    PhonesCollection.models.forEach((item) =>
      itemTemplate = "";

      if item
        itemTemplate = this.template.replace(/%name%/g, item.attributes.name);
        itemTemplate = itemTemplate.replace(/%phone%/g, item.attributes.phone);
        itemTemplate = itemTemplate.replace(/%id%/g, item.attributes.id);
        renderTemplate += itemTemplate;
    );

    this.el.innerHTML = renderTemplate;
  editItem: (event) ->
    target = event.target;

    editId = target.getAttribute("data-id");

    PhonesCollection.trigger("update", editId);

    new TableEdit({
      id: editId,
      el: document.querySelector("[data-edit][data-id=#{editId}]").closest("tr")
    });
  deleteItem: (event) ->
    target = event.target;

    deleteItem = PhonesCollection.models.find((item) -> item.id == target.getAttribute("data-id"))

    PhonesCollection.remove(deleteItem);
});
