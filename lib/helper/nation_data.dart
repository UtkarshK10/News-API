import 'package:newsapp/models/nation_model.dart';

List<NationModel>getNation()
{
List<NationModel>nation = List<NationModel>();
NationModel nationModel=NationModel();
nationModel.nationName='USA';
nationModel.nationCode='us';
nationModel.nationImageUrl='https://images-na.ssl-images-amazon.com/images/I/71J2%2BQiNWDL._AC_SL1500_.jpg';
nation.add(nationModel);



nationModel=new NationModel();
nationModel.nationName='India';
nationModel.nationCode='in';
nationModel.nationImageUrl='https://cdn2.vectorstock.com/i/1000x1000/51/11/tricolor-indian-flag-background-for-republic-an-vector-19235111.jpg';
nation.add(nationModel);

nationModel=new NationModel();
nationModel.nationName='Egypt';
nationModel.nationCode='eg';
nationModel.nationImageUrl='https://cdn.pixabay.com/photo/2015/11/12/16/23/flag-1040586_960_720.png';
nation.add(nationModel);

nationModel=new NationModel();
nationModel.nationName='Australia';
nationModel.nationCode='au';
nationModel.nationImageUrl='https://www.publicdomainpictures.net/pictures/230000/nahled/australia-flag.jpg';
nation.add(nationModel);

nationModel=new NationModel();
nationModel.nationName='United Kingdom';
nationModel.nationCode='gb';
nationModel.nationImageUrl='https://cdn.pixabay.com/photo/2012/04/10/16/14/union-jack-26119__340.png';
nation.add(nationModel);

nationModel=new NationModel();
nationModel.nationName='Russia';
nationModel.nationCode='ru';
nationModel.nationImageUrl='https://sldinfo.com/wp-content/uploads/2017/12/bigstock-China-Flag-6103851.jpg';
nation.add(nationModel);

return nation;


}