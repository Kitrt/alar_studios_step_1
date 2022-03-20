import {View} from "backbone";

import {Form} from "./components/Form/index.coffee";
import {Table} from "./components/Table/index.coffee";

RootView = View.extend({
  el: "#root",
  initialize: ->
    this.render();
  render: ->
    new Form({el: this.el});
    new Table({el: this.el});
});

new RootView();
