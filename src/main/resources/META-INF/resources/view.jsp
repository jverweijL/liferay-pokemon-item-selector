<%--
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/init.jsp" %>

<%
String itemSelectorURL = (String)request.getAttribute("itemSelectorURL");
String eventName = (String)request.getAttribute("eventName");
%>

<clay:button
	id="selectPokemonBtn"
	label="Select Pokemon"
/>

<div class="hide" id="pokemonPreview" style="text-align: center;">
	<h1 id="pokemonTitle"></h1>

	<img id="pokemonImage" src="" />
</div>

<aui:script require="frontend-js-web/liferay/ItemSelectorDialog.es as ItemSelectorDialog">
	var selectPokemonBtn = document.getElementById(
		'selectPokemonBtn'
	);

	var pokemonPreview = document.getElementById(
		'pokemonPreview'
	);

	var pokemonTitle = document.getElementById(
		'pokemonTitle'
	);

	var pokemonImage = document.getElementById(
		'pokemonImage'
	);

	selectPokemonBtn.addEventListener('click', function (event) {
		var itemSelectorDialog = new ItemSelectorDialog.default({
			eventName: '<%= eventName %>',
			title: 'Select a pokemon',
			singleSelect: true,
			url:'<%= itemSelectorURL %>',
		});

		itemSelectorDialog.open();

		itemSelectorDialog.on('selectedItemChange', function (event) {
			var selectedItem = event.selectedItem;

			if (selectedItem) {//always check this, will be null is user cancel or close the dialog
				var itemValue = JSON.parse(selectedItem.value);

				pokemonTitle.innerText = itemValue.name;
				pokemonImage.src= itemValue.image;

				pokemonPreview.classList.remove('hide');
			}
			else {
				pokemonPreview.classList.add('hide');
			}
		});
	});
</aui:script>