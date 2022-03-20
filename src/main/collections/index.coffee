import {Collection} from "backbone";

import {PhonesModel} from "../models/phones.coffee";

import {loadStore} from "./loadStore.coffee";

import {Storage} from "../utils/index.coffee";

PhonesCollection = Collection.extend({
  model: PhonesModel,
});

collection = new PhonesCollection();
collection.set(loadStore());

collection.on("update", () ->
  Storage("phones-data", collection.models);
);

export default collection;
