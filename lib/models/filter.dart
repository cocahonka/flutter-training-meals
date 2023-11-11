enum Filter {
  gluttenFree,
  lactoseFree,
  vegeterian,
  vegan,
}

typedef FiltersStatus = ({
  bool gluttenFree,
  bool lactoseFree,
  bool vegeterian,
  bool vegan,
});
