namespace hc450.officesupplies;
using {Currency, managed} from '@sap/cds/common';
entity Products : managed {
  @Common.Label    : 'UUID'
  key ID           : UUID;
  identifier       : String   @Common.Label : 'Product ID';
  title            : localized String @Common.Label : 'Product Name';
  description      : localized String;
  availability     : Integer;
  storage_capacity : Integer;
  criticality      : Integer;
  price            : Decimal(9,2);
  currency         : Currency;
  supplier         : Association to Suppliers;
  image_url        : String;
}

entity Suppliers : managed {
  key ID           : UUID;
  identifier       : String;
  name             : String;
  phone            : String;
  building         : String;
  street           : String @UI.MultiLineText;
  postcode         : String;
  city             : String;
  country          : String;
  products         : Composition of many Products
                    on products.supplier = $self;
}