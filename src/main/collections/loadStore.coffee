import {PhonesModel} from "../models/phones.coffee";

import {nanoid, Storage} from "../utils/index.coffee";

loadStore = () ->
  data = Storage("phones-data", null);
  defaultData = [
    new PhonesModel({id: nanoid(), name: 'Nazariy Kiril', phone: "+7(910)221-22-22"}),
    new PhonesModel({id: nanoid(), name: 'Stathis Bruce', phone: "+7(910)221-22-22"}),
    new PhonesModel({id: nanoid(), name: 'Zora Keir', phone: "+7(910)221-22-22"}),
    new PhonesModel({id: nanoid(), name: 'Victor Besnik', phone: "+7(910)221-22-22"}),
    new PhonesModel({id: nanoid(), name: 'Melati Antanina', phone: "+7(910)221-22-22"}),
  ];

  if !data
    Storage("phones-data", defaultData);
    return defaultData;
  else
    data = Storage("phones-data");
    return data;

export {loadStore};