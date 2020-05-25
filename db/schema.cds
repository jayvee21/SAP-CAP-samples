namespace sap.capire.bookshop;
using { Currency, managed, cuid } from '@sap/cds/common';

// Using custom Entity service
using { sap.mycustom.reusable.Products } from './reusable/custom';

entity Books : Products, additionalInfo {
    author  : Association to Authors;
}


entity Magazines : Products {
    publisher: String;
}

// Expand annotation
@cds.autoexpose
entity Authors  : managed {
    key ID  : Integer;
    name    : String(111);
    books   : Association to many Books on books.author = $self;
}

entity Orders : managed, cuid {
    OrderNo : String @title:'Order Number'; //> readable key
    Items   : Composition of many OrderItems on Items.parent = $self;
}

entity OrderItems: cuid {
    parent  : Association to Orders;
    book    : Association to Books;
    amount  : Integer;
}

entity Movies : additionalInfo {
    key ID  : Integer;
    name    : String;
}

aspect additionalInfo {
    genre       : String(100);
    language    : String(200);
}