import {Model} from "backbone";

export PhonesModel = Model.extend({
  defaults: {
    id: null,
    name: "",
    phone: ""
  }
});