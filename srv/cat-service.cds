using { sap.capire.bookshop as my } from '../db/schema';
@path:'/browse' 

/**
 * Implementing custom service - different filename.
 */
@impl: 'my-service.js' 

service CatalogService {

    // -- With author name
    // @readonly entity Books as 
    //     SELECT from my.Books { 
    //         *, author.name as author 
    //     } excluding { createdBy, modifiedBy };

    // Without author name
    @readonly entity Books as SELECT from my.Books { * } excluding { createdBy, modifiedBy };
    
    @requires_: 'authenticated-user' 
    @insertonly entity Orders as projection on my.Orders;

}