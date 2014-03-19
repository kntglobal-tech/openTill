﻿using openTill.Domain.DTO;
using openTill.Domain.Interface.Service;
using openTill.Domain.Services;
using openTill.GUI.Commands;
using openTill.Persistence;
using System.Collections.ObjectModel;
using System.Linq;

namespace openTill.GUI
{
    public class InventoryViewModel : ObservableObject
    {
        private IProductService productService;
        private BrandDTO[] _brands;

        /// <summary>
        /// List of brands for use in product dropdown
        /// </summary>
        public BrandDTO[] Brands
        {
            get { return _brands; }
            set { _brands = value; }
        }

        private ObservableCollection<ObservableProduct> _products;

        /// <summary>
        /// Internal collection of products for use by the view
        /// </summary>
        public ObservableCollection<ObservableProduct> Products
        {
            get { return _products; }
            set { _products = value; }
        }

        private ObservableProduct _selectedProduct = new ObservableProduct(new ProductDTO());

        /// <summary>
        /// The currently selected product, may not be part of Products collection
        /// </summary>
        public ObservableProduct SelectedProduct
        {
            get { return _selectedProduct; }
            set
            {
                _selectedProduct = value;
                RaisePropertyChanged("SelectedProduct");
            }
        }

        private AddProductCommand addCommand;

        /// <summary>
        /// Instance of a command for adding the selected product to Products collection
        /// </summary>
        public AddProductCommand AddCommand
        {
            get { return addCommand; }
            private set { addCommand = value; }
        }

        private RemoveProductCommand removeCommand;

        /// <summary>
        /// Instance of a command for removing the selected product from the Products collection
        /// </summary>
        public RemoveProductCommand RemoveCommand
        {
            get { return removeCommand; }
            private set { removeCommand = value; }
        }

        /// <summary>
        /// Default constructor, hooks up to the product and brand services from openTill.Domain
        /// </summary>
        public InventoryViewModel()
        {
            this.productService = new ProductService(new ProductRepository());
            Products = new ObservableCollection<ObservableProduct>(productService.GetAllProducts().Select(x => new ObservableProduct(x)));
            Brands = new BrandService(new BrandRepository()).GetAllBrands().ToArray();
            AddCommand = new AddProductCommand(this);
            RemoveCommand = new RemoveProductCommand(this);
        }

        /// <summary>
        /// Constructor taking product and brand services as parameters, for testing
        /// </summary>
        /// <param name="productService">an object that implements IProductService</param>
        /// <param name="brandService">an object that implements IBrandService</param>
        public InventoryViewModel(IProductService productService, IBrandService brandService)
        {
            this.productService = productService;
            Brands = brandService.GetAllBrands().ToArray();
        }
    }
}