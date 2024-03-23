import 'package:bookly/Features/home/domain/entities/book_entity.dart';


class BookModel extends BookEntity{
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  BookModel({this.kind, this.id, this.etag, this.selfLink, this.volumeInfo,
      this.saleInfo, this.accessInfo, this.searchInfo}):
        super(
    title:volumeInfo!.title!,
    image: volumeInfo.imageLinks?.thumbnail,
    bookId: id!,
    authorName: volumeInfo.authors?[0],
    price: saleInfo?.retailPrice?.amount??0,
    rating:'0',
  );

  factory BookModel.fromJson(Map<String, dynamic> json)=>
  BookModel(
      kind : json['kind'],
      id : json['id'],
      etag : json['etag'],
  selfLink : json['selfLink'],
  volumeInfo : json['volumeInfo'] != null
  ?  VolumeInfo.fromJson(json['volumeInfo'])
      : null,
  saleInfo :json['saleInfo'] != null
  ?  SaleInfo.fromJson(json['saleInfo'])
      : null,
  accessInfo : json['accessInfo'] != null
  ?  AccessInfo.fromJson(json['accessInfo'])
      : null,
  searchInfo : json['searchInfo'] != null
  ?  SearchInfo.fromJson(json['searchInfo'])
      : null,
  );
}

class VolumeInfo {
  String? title;
  List<dynamic>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  List<IndustryIdentifiers>? industryIdentifiers;
  ReadingModes? readingModes;
  int? pageCount;
  String? printType;
  List<dynamic>? categories;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;
  String? subtitle;

  VolumeInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    authors =(json['authors'] as List<dynamic>?)?.map((item)=>item.toString()).toList();
    publisher = json['publisher'];
    publishedDate = json['publishedDate'];
    description = json['description'];
    if (json['industryIdentifiers'] != null) {
      industryIdentifiers = <IndustryIdentifiers>[];
      json['industryIdentifiers'].forEach((v) {
        industryIdentifiers!.add( IndustryIdentifiers.fromJson(v));
      });
    }
    readingModes = json['readingModes'] != null
        ?  ReadingModes.fromJson(json['readingModes'])
        : null;
    pageCount = json['pageCount'];
    printType = json['printType'];
    categories = (json['categories']as List<dynamic>?)?.map((e) => e.toString()).toList();
    maturityRating = json['maturityRating'];
    allowAnonLogging = json['allowAnonLogging'];
    contentVersion = json['contentVersion'];
    panelizationSummary = json['panelizationSummary'] != null
        ?  PanelizationSummary.fromJson(json['panelizationSummary'])
        : null;
    imageLinks = json['imageLinks'] != null
        ?  ImageLinks.fromJson(json['imageLinks'])
        : null;
    language = json['language'];
    previewLink = json['previewLink'];
    infoLink = json['infoLink'];
    canonicalVolumeLink = json['canonicalVolumeLink'];
    subtitle = json['subtitle'];
  }

}

class IndustryIdentifiers {
  String? type;
  String? identifier;

  IndustryIdentifiers({this.type, this.identifier});

  IndustryIdentifiers.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    identifier = json['identifier'];
  }
}

class ReadingModes {
  bool? text;
  bool? image;

  ReadingModes({this.text, this.image});

  ReadingModes.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    image = json['image'];
  }
}

class PanelizationSummary {
  bool? containsEpubBubbles;
  bool? containsImageBubbles;


  PanelizationSummary.fromJson(Map<String, dynamic> json) {
    containsEpubBubbles = json['containsEpubBubbles'];
    containsImageBubbles = json['containsImageBubbles'];
  }

}

class ImageLinks {
  String? smallThumbnail;
  String? thumbnail;


  ImageLinks.fromJson(Map<String, dynamic> json) {
    smallThumbnail = json['smallThumbnail'];
    thumbnail = json['thumbnail'];
  }
}

class SaleInfo {
  String? country;
  String? saleability;
  bool? isEbook;
  ListPrice? listPrice;
  ListPrice? retailPrice;
  String? buyLink;
  List<Offers>? offers;


  SaleInfo.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    saleability = json['saleability'];
    isEbook = json['isEbook'];
    listPrice = json['listPrice'] != null
        ?  ListPrice.fromJson(json['listPrice'])
        : null;
    retailPrice = json['retailPrice'] != null
        ?  ListPrice.fromJson(json['retailPrice'])
        : null;
    buyLink = json['buyLink'];
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add( Offers.fromJson(v));
      });
    }
  }
}

class ListPrice {
  double? amount;
  String? currencyCode;

  ListPrice({this.amount, this.currencyCode});

  ListPrice.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currencyCode = json['currencyCode'];
  }
}

class Offers {
  int? finskyOfferType;
  ListPrice? listPrice;
  ListPrice? retailPrice;
  bool? giftable;


  Offers.fromJson(Map<String, dynamic> json) {
    finskyOfferType = json['finskyOfferType'];
    listPrice = json['listPrice'] != null
        ?  ListPrice.fromJson(json['listPrice'])
        : null;
    retailPrice = json['retailPrice'] != null
        ?  ListPrice.fromJson(json['retailPrice'])
        : null;
    giftable = json['giftable'];
  }

}


class AccessInfo {
  String? country;
  String? viewability;
  bool? embeddable;
  bool? publicDomain;
  String? textToSpeechPermission;
  Epub? epub;
  Pdf? pdf;
  String? webReaderLink;
  String? accessViewStatus;
  bool? quoteSharingAllowed;


  AccessInfo.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    viewability = json['viewability'];
    embeddable = json['embeddable'];
    publicDomain = json['publicDomain'];
    textToSpeechPermission = json['textToSpeechPermission'];
    epub = json['epub'] != null ?  Epub.fromJson(json['epub']) : null;
    pdf = json['pdf'] != null ?  Pdf.fromJson(json['pdf']) : null;
    webReaderLink = json['webReaderLink'];
    accessViewStatus = json['accessViewStatus'];
    quoteSharingAllowed = json['quoteSharingAllowed'];
  }
}

class Epub {
  bool? isAvailable;
  String? acsTokenLink;
  String? downloadLink;

  Epub.fromJson(Map<String, dynamic> json) {
    isAvailable = json['isAvailable'];
    acsTokenLink = json['acsTokenLink'];
    downloadLink = json['downloadLink'];
  }
}

class Pdf {
  bool? isAvailable;
  String? acsTokenLink;

  Pdf.fromJson(Map<String, dynamic> json) {
    isAvailable = json['isAvailable'];
    acsTokenLink = json['acsTokenLink'];
  }

}

class SearchInfo {
  String? textSnippet;

  SearchInfo.fromJson(Map<String, dynamic> json) {
    textSnippet = json['textSnippet'];
  }

}