import { customAlphabet } from "nanoid";

nanoid = customAlphabet("abcdefyqerABCDEFTYUI", 15);

export {nanoid};

export Storage = (name, data) ->
  try
    if !data
      return JSON.parse localStorage.getItem name;
    localStorage.setItem name, JSON.stringify data;
  catch e
    console.error(e);

export Validate = (props) ->
  errors = [];

  for key,value of props
    value.el.classList.remove("field__elem--error");
    value.el.closest(".field")?.querySelector(".field__error")?.remove();

    if !value.value
      errors.push {key, el: value.el, text: "Вы не заполнили поле."};

    if key == "phone" && value.value && !props.phone.value.match(/^(\+7|8)[\(]?\d{3}\)?-?\d{3}-?\d{2}-?\d{2}$/)
      errors.push {key: "phone", el: props.phone.el, text: "Неверно заполнено поле, пример заполнения +7(888)888-88-88."};

  for prop in errors
    prop.el.classList.add("field__elem--error");
    prop.el.insertAdjacentHTML("afterend", "<div class='field__error'>#{prop.text}</div>");

  return errors.length == 0;
