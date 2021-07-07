import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import './provider/products.dart';

class ProductAdd extends StatefulWidget {
  @override
  _ProductAddState createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  final _name = TextEditingController();
  final _price = TextEditingController();
  final _info = TextEditingController();

  late TextEditingController _pickDateController;
  String _date = '01/01/2025';
  @override
  void initState() {
    super.initState();
    _pickDateController = TextEditingController(text: _date);
  }

  String dropdownvaluechr = 'Electronics';

  var itemchr = ['Electronics', 'Cloths', 'Vegetables', 'Software'];

  Future<void> _simpleDialog(String val) async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(val),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, "Yes");
                },
                child: const Text('Yes'),
              ),
            ],
          );
        })) {
      case "Yes":
        break;
      case "No":
        return;
        // ignore: dead_code
        break;
    }
  }

  _submitData() async {
    if (_name.text.isEmpty || _price.text.isEmpty || _info.text.isEmpty) {
      _simpleDialog("Please fill all information in  login form ");
    } else {
      try {
        await Provider.of<Products>(context, listen: false).addProduct(
            _name.text,
            int.parse(_price.text),
            _info.text,
            _pickDateController.text,
            dropdownvaluechr);

        _name.clear();
        _price.clear();
        _info.clear();

        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('New Product'),
            content: Text('Product add succesful.'),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      } catch (error) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('An error occurred!'),
            content: Text('Something went wrong.'),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Product Registration"),
      ),
      body: Container(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: <Widget>[
                TextField(
                  onSubmitted: (_) => _submitData(),
                  controller: _name,
                  decoration: InputDecoration(
                      labelText: 'Product Name',
                      hintText: 'Enter Product Name'),
                ),
                TextField(
                  onSubmitted: (_) => _submitData(),
                  controller: _price,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      suffix: Text("FRW"),
                      labelText: 'Price',
                      hintText: 'Enter Product Price'),
                ),
                TextField(
                  onSubmitted: (_) => _submitData(),
                  controller: _info,
                  decoration: InputDecoration(
                      labelText: 'Product Description',
                      hintText: 'Enter  information on Product'),
                ),
                TextField(
                  onSubmitted: (_) => _submitData(),
                  controller: _pickDateController,
                  style: TextStyle(color: Colors.blue),
                  cursorColor: Colors.lightBlueAccent,
                  readOnly: true,
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: DateTime(2005, 1, 1),
                              firstDate: DateTime(2005, 1, 1),
                              lastDate: DateTime.now(),
                              initialDatePickerMode: DatePickerMode.year,
                            );
                            if (date != null) {
                              var formatter = new DateFormat('MM/dd/yyyy');
                              _pickDateController.text = formatter.format(date);
                            }
                          },
                          child: Icon(Icons.date_range))),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Select  Product Category"),
                    DropdownButton(
                      onChanged: (String? string) {
                        setState(() {
                          dropdownvaluechr = string!;
                        });
                      },
                      value: dropdownvaluechr,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: itemchr.map((String items) {
                        return DropdownMenuItem(
                            value: items, child: Text(items));
                      }).toList(),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  color: Colors.blue.shade900,
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    _submitData();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
