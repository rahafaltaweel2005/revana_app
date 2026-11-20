import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constant/color_const.dart';
import '../../../../../core/textfield/revana_text_field.dart';
import '../../../domain/entity/category_entity.dart';
import '../../createcategory/cubit/create_category_cubit.dart';
import '../../createcategory/state/create_category_state.dart';
import '../../deletecategory/cubit/delete_category_cubit.dart';
import '../../deletecategory/state/delete_category_state.dart';
import '../../editcategory/cubit/edit_category_cubit.dart';
import '../../editcategory/state/edit_category_state.dart';
import '../cubit/view_admin_category_cubit.dart';
import '../state/view_admin_category_state.dart';

class ViewAdminCategoriesScreen extends StatefulWidget {
  const ViewAdminCategoriesScreen({super.key});

  @override
  State<ViewAdminCategoriesScreen> createState() =>
      _ViewAdminCategoriesScreenState();
}

class _ViewAdminCategoriesScreenState extends State<ViewAdminCategoriesScreen> {
  List<CategoryEntity> allCategories = [];
  List<CategoryEntity> filteredCategories = [];
  TextEditingController searchController = TextEditingController();
  TextEditingController newCategoryController = TextEditingController();

  void search(String searchController) {
    setState(() {
      filteredCategories = allCategories
          .where(
            (category) => category.name.toLowerCase().contains(
              searchController.toLowerCase(),
            ),
          )
          .toList();
    });
  }@override
  void dispose() {
    searchController.dispose();
    newCategoryController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<ViewAdminCategoryCubit>().viewAdminCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<EditCategoryCubit, EditCategoryState>(
        listener: (context, state) {
          if(state is EditCategorySuccessState){
            context.read<ViewAdminCategoryCubit>().viewAdminCategories();
          }
          if (state is EditCategoryErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child:BlocListener<DeleteCategoryCubit, DeleteCategoryState>(
        listener: (context, state) {
          if(state is DeleteCategorySuccessState){
            context.read<ViewAdminCategoryCubit>().viewAdminCategories();
          }
          if (state is DeleteCategoryErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: BlocListener<CreateCategoryCubit, CreateCategoryState>(
          listener: (context, state) {
            if (state is CreateCategorySuccessState) {
              context.read<ViewAdminCategoryCubit>().viewAdminCategories();
            }
            if (state is CreateCategoryErrorState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: BlocBuilder<ViewAdminCategoryCubit, ViewAdminCategoryState>(
            builder: (context, state) {
              if (state is ViewAdminCategoryLoadingState) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is ViewAdminCategoryLoadedState) {

                  allCategories = state.categories;
                  filteredCategories = state.categories;

                if (state.categories.isEmpty) {
                  return Center(child: Text("No categories found"));
                }

                return Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "OLFACTORY ARCHITECTURE \\ CURATORIAL TAXONOMY",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: ColorConst.onSurfaceVariant,
                                ),
                              ),
                              Text(
                                "Categories",
                                style: TextStyle(
                                  fontFamily: 'PlayfairDisplay',
                                  fontSize: 35,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600,
                                  color: ColorConst.textDark,
                                ),
                              ),
                              Text(
                                "Manage perfume olfactory families, define catalog taxonomy, and\nmonitor linked bespoke flacons across the Maison collections.",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: ColorConst.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Divider(),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: RevanaTextField(
                              hint: 'Search categories',
                              prefixIcon: Icon(Icons.search),
                              controller: searchController,
                              obscureText: false,
                              onChange: (value) {
                                search(value);
                              },
                            ),
                          ),
                          SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {

                              showDialog(
                                context: context,
                               builder: (_) {
                                return AlertDialog(
                                   title: Text("Create Category"),
                                   content: SizedBox(
                                     width: 300,
                                     height: 90,

                                     child: RevanaTextField(
                                       hint: 'Category Name',
                                       controller: newCategoryController,
                                       obscureText: false,
                                     ),
                                   ),
                                   actions: [
                                     TextButton(
                                       onPressed: () {
                                         Navigator.of(context).pop();
                                       },
                                       child: Text("Cancel"),
                                     ),
                                     TextButton(
                                       onPressed: () {
                                         context.read<CreateCategoryCubit>().createCategory(name: newCategoryController.text);
                                         Navigator.of(context).pop();
                                         newCategoryController.clear();
                                       },
                                       child: Text("Create"),
                                     ),
                                   ],

                                 );
                               }
                              );
                            },
                            child: Row(
                              children: [Icon(Icons.add), Text("Add Category")],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: ListView.builder(
                          itemCount: filteredCategories.length,

                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorConst.surfaceContainerHigh,
                                border: Border.all(color: ColorConst.outline, width: 1)

                              ),
                              child: Row(
                                children: [
                                  Text(filteredCategories[index].name),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      newCategoryController.text = filteredCategories[index].name;

                                      showDialog(context: context, builder: (_){
                                        return AlertDialog(
                                          title: Text("Edit Category"),
                                          content: SizedBox(
                                            width: 300,
                                            height: 90,

                                            child: RevanaTextField(
                                              hint: 'Category Name',
                                              controller: newCategoryController,
                                              obscureText: false,
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Cancel"),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                context.read<EditCategoryCubit>().editCategory(id: filteredCategories[index].id, name: newCategoryController.text);
                                                Navigator.of(context).pop();
                                                newCategoryController.clear();
                                                context.read<ViewAdminCategoryCubit>().viewAdminCategories();
                                              },
                                              child: Text("Edit"),
                                            ),
                                          ],
                                        );
                                      });
                                    },
                                    icon: Icon(Icons.edit_outlined),
                                  ),

                                  IconButton(
                                    onPressed: () {
                                      showDialog(context: context, builder: (_){
                                        return AlertDialog(
                                          title: Text("Delete Category"),
                                          content: Text("Are you sure you want to delete this category?"),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Cancel"),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                context.read<DeleteCategoryCubit>().deleteCategory(id: filteredCategories[index].id);
                                                Navigator.of(context).pop();
                                                context.read<ViewAdminCategoryCubit>().viewAdminCategories();
                                              },
                                              child: Text("Delete"),
                                            ),
                                          ],
                                        );
                                      });
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (state is ViewAdminCategoryErrorState) {
                return Center(child: Text(state.message));
              }
              return Container();
            },
          ),
        ),
      ),
      ),
    );
  }
}
